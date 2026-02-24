package com.example.TravelBundle.bundle;

import com.example.TravelBundle.destination.Destination;
import com.example.TravelBundle.destination.DestinationRepository;
import com.example.TravelBundle.flight.Flight;
import com.example.TravelBundle.flight.FlightRepository;
import com.example.TravelBundle.hotel.Hotel;
import com.example.TravelBundle.hotel.HotelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class BundleService {

    @Autowired
    private FlightRepository flightRepository;

    @Autowired
    private HotelRepository hotelRepository;

    @Autowired
    private DestinationRepository destinationRepository;

    public BundleResponse buildBundles(BundleRequest request) {
        Destination destination = destinationRepository.findByName(request.getDestination())
                .orElseThrow(() -> new RuntimeException("Destination not found"));

        // Step 1 - Filter Flights
        List<Flight> validFlights = flightRepository
                .findByDestinationAndDepartureDateAfterAndTravelClassAndAvailableSeatsGreaterThanAndPriceLessThanEqual(
                        destination, request.getDepartureDate().minusSeconds(1), request.getTravelClass(), 0,
                        request.getBudget());

        // Step 2 - Calculate Trip Duration
        long nights = ChronoUnit.DAYS.between(request.getDepartureDate(), request.getReturnDate());

        List<BundleResponse.BundleDTO> bundleDTOs = new ArrayList<>();

        for (Flight flight : validFlights) {
            // Step 3 - Filter Hotels
            double remainingBudget = request.getBudget() - flight.getPrice();
            List<Hotel> validHotels = hotelRepository.findByDestinationAndAvailableRoomsGreaterThan(destination, 0)
                    .stream()
                    .filter(h -> h.getPricePerNight() * nights <= remainingBudget)
                    .collect(Collectors.toList());

            // Step 4 - Build Bundles
            for (Hotel hotel : validHotels) {
                double totalHotelCost = hotel.getPricePerNight() * nights;
                double totalBundlePrice = flight.getPrice() + totalHotelCost;

                if (totalBundlePrice <= request.getBudget()) {
                    BundleResponse.BundleDTO bundleDTO = new BundleResponse.BundleDTO();

                    BundleResponse.FlightDTO flightDTO = new BundleResponse.FlightDTO();
                    flightDTO.setAirline(flight.getAirline());
                    flightDTO.setTravelClass(flight.getTravelClass());
                    flightDTO.setFlightPrice(flight.getPrice());

                    BundleResponse.HotelDTO hotelDTO = new BundleResponse.HotelDTO();
                    hotelDTO.setName(hotel.getName());
                    hotelDTO.setPricePerNight(hotel.getPricePerNight());
                    hotelDTO.setTotalHotelCost(totalHotelCost);
                    hotelDTO.setRating(hotel.getRating());

                    bundleDTO.setFlight(flightDTO);
                    bundleDTO.setHotel(hotelDTO);
                    bundleDTO.setTotalBundlePrice(totalBundlePrice);
                    bundleDTO.setBudgetRemaining(request.getBudget() - totalBundlePrice);

                    // Step 5 - Calculate Value Score
                    double valueScore = (hotel.getRating() / totalBundlePrice) * 1000;
                    // Optional bonus: (budgetRemaining / budget * 2)
                    valueScore += (bundleDTO.getBudgetRemaining() / request.getBudget() * 2);

                    bundleDTO.setValueScore(Math.round(valueScore * 100.0) / 100.0);
                    bundleDTOs.add(bundleDTO);
                }
            }
        }

        // Step 6 - Sort & Return
        List<BundleResponse.BundleDTO> sortedBundles = bundleDTOs.stream()
                .sorted(Comparator.comparing(BundleResponse.BundleDTO::getValueScore).reversed())
                .limit(5)
                .collect(Collectors.toList());

        for (int i = 0; i < sortedBundles.size(); i++) {
            sortedBundles.get(i).setRank(i + 1);
        }

        BundleResponse response = new BundleResponse();
        response.setDestination(request.getDestination());
        response.setTripDurationNights(nights);
        response.setTotalBundlesFound(bundleDTOs.size());
        response.setBundles(sortedBundles);

        return response;
    }
}

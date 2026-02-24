package com.example.TravelBundle.flight;

import com.example.TravelBundle.destination.Destination;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface FlightRepository extends JpaRepository<Flight, Long> {
    List<Flight> findByDestinationAndDepartureDateAfterAndTravelClassAndAvailableSeatsGreaterThanAndPriceLessThanEqual(
            Destination destination, LocalDateTime departureDate, String travelClass, Integer availableSeats,
            Double budget);
}

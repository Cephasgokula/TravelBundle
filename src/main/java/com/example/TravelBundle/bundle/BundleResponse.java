package com.example.TravelBundle.bundle;

import java.util.List;

public class BundleResponse {
    private String destination;
    private Long tripDurationNights;
    private Integer totalBundlesFound;
    private List<BundleDTO> bundles;

    public static class BundleDTO {
        private Integer rank;
        private Double valueScore;
        private FlightDTO flight;
        private HotelDTO hotel;
        private Double totalBundlePrice;
        private Double budgetRemaining;

        // Getters and Setters
        public Integer getRank() {
            return rank;
        }

        public void setRank(Integer rank) {
            this.rank = rank;
        }

        public Double getValueScore() {
            return valueScore;
        }

        public void setValueScore(Double valueScore) {
            this.valueScore = valueScore;
        }

        public FlightDTO getFlight() {
            return flight;
        }

        public void setFlight(FlightDTO flight) {
            this.flight = flight;
        }

        public HotelDTO getHotel() {
            return hotel;
        }

        public void setHotel(HotelDTO hotel) {
            this.hotel = hotel;
        }

        public Double getTotalBundlePrice() {
            return totalBundlePrice;
        }

        public void setTotalBundlePrice(Double totalBundlePrice) {
            this.totalBundlePrice = totalBundlePrice;
        }

        public Double getBudgetRemaining() {
            return budgetRemaining;
        }

        public void setBudgetRemaining(Double budgetRemaining) {
            this.budgetRemaining = budgetRemaining;
        }
    }

    public static class FlightDTO {
        private String airline;
        private String travelClass;
        private Double flightPrice;

        // Getters and Setters
        public String getAirline() {
            return airline;
        }

        public void setAirline(String airline) {
            this.airline = airline;
        }

        public String getTravelClass() {
            return travelClass;
        }

        public void setTravelClass(String travelClass) {
            this.travelClass = travelClass;
        }

        public Double getFlightPrice() {
            return flightPrice;
        }

        public void setFlightPrice(Double flightPrice) {
            this.flightPrice = flightPrice;
        }
    }

    public static class HotelDTO {
        private String name;
        private Double pricePerNight;
        private Double totalHotelCost;
        private Double rating;

        // Getters and Setters
        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public Double getPricePerNight() {
            return pricePerNight;
        }

        public void setPricePerNight(Double pricePerNight) {
            this.pricePerNight = pricePerNight;
        }

        public Double getTotalHotelCost() {
            return totalHotelCost;
        }

        public void setTotalHotelCost(Double totalHotelCost) {
            this.totalHotelCost = totalHotelCost;
        }

        public Double getRating() {
            return rating;
        }

        public void setRating(Double rating) {
            this.rating = rating;
        }
    }

    // Getters and Setters for BundleResponse
    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public Long getTripDurationNights() {
        return tripDurationNights;
    }

    public void setTripDurationNights(Long tripDurationNights) {
        this.tripDurationNights = tripDurationNights;
    }

    public Integer getTotalBundlesFound() {
        return totalBundlesFound;
    }

    public void setTotalBundlesFound(Integer totalBundlesFound) {
        this.totalBundlesFound = totalBundlesFound;
    }

    public List<BundleDTO> getBundles() {
        return bundles;
    }

    public void setBundles(List<BundleDTO> bundles) {
        this.bundles = bundles;
    }
}

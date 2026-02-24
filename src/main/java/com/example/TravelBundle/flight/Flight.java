package com.example.TravelBundle.flight;

import java.time.LocalDateTime;

import com.example.TravelBundle.destination.Destination;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class Flight {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private Destination destination;
    
    private String airline;
    private LocalDateTime departureDate;
    private String travelClass;
    private Double price;
    private Integer availableSeats;

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public Destination getDestination() {
        return destination;
    }
    public void setDestination(Destination destination) {
        this.destination = destination;
    }
    public String getAirline() {
        return airline;
    }
    public void setAirline(String airline) {
        this.airline = airline;
    }
    public LocalDateTime getDepartureDate() {
        return departureDate;
    }
    public void setDepartureDate(LocalDateTime departureDate) {
        this.departureDate = departureDate;
    }
    public String getTravelClass() {
        return travelClass;
    }
    public void setTravelClass(String travelClass) {
        this.travelClass = travelClass;
    }
    public Double getPrice() {
        return price;
    }
    public void setPrice(Double price) {
        this.price = price;
    }
    public Integer getAvailableSeats() {
        return availableSeats;
    }
    public void setAvailableSeats(Integer availableSeats) {
        this.availableSeats = availableSeats;
    }
   
}

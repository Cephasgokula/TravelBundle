package com.example.TravelBundle.hotel;

import com.example.TravelBundle.destination.Destination;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class Hotel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private Destination destination;

    private String name;
    private Double pricePerNight;
    private Integer availableRooms;
    private Double rating;
    
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
    public Integer getAvailableRooms() {
        return availableRooms;
    }
    public void setAvailableRooms(Integer availableRooms) {
        this.availableRooms = availableRooms;
    }
    public Double getRating() {
        return rating;
    }
    public void setRating(Double rating) {
        this.rating = rating;
    }
    
}

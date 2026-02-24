package com.example.TravelBundle.hotel;

import com.example.TravelBundle.destination.Destination;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HotelRepository extends JpaRepository<Hotel, Long> {
    List<Hotel> findByDestinationAndAvailableRoomsGreaterThan(Destination destination, Integer availableRooms);
}

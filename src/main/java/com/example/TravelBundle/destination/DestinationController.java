package com.example.TravelBundle.destination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/destinations")
public class DestinationController {

    @Autowired
    private DestinationRepository destinationRepository;

    @GetMapping
    public List<Destination> getAllDestinations() {
        return destinationRepository.findAll();
    }

    @PostMapping
    public Destination createDestination(@RequestBody Destination destination) {
        return destinationRepository.save(destination);
    }
}

package com.example.Flight.controller;

import com.example.Flight.Service.FlightService;
import com.example.Flight.model.Flight;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/flights")
@RequiredArgsConstructor
public class FlightController {

    private final FlightService flightService;

    @GetMapping
    public List<Flight> getAllFlights() {
        return flightService.getAllFlights();
    }

    @GetMapping("/{id}")
    public Flight getFlightById(@PathVariable Long id) {
        return flightService.getFlightById(id);
    }

    @GetMapping("/search")
    public List<Flight> searchFlights(@RequestParam String destination) {
        return flightService.getFlightsByDestination(destination);
    }
}
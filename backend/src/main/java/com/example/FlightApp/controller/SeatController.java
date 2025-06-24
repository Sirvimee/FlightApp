package com.example.FlightApp.controller;

import com.example.FlightApp.model.*;
import com.example.FlightApp.service.SeatService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/seats")
@RequiredArgsConstructor
public class SeatController {
    private final SeatService seatService;

    @GetMapping
    public List<Seat> getAllSeats() {
        return seatService.getAllSeats();
    }

    @GetMapping("/{id}")
    public Optional<Seat> getSeatById(@PathVariable Long id) {
        return Optional.ofNullable(seatService.getSeatById(id));
    }

    @GetMapping("/flight/{flightId}")
    public List<FlightSeat> getSeatsForFlight(@PathVariable Long flightId) {
        return seatService.getSeatsForFlight(flightId);
    }

    @GetMapping("/airplane/{airplaneId}")
    public List<AirplaneSeat> getSeatsForAirplane(@PathVariable Long airplaneId) {
       return seatService.getSeatsForAirplane(airplaneId);
    }

}
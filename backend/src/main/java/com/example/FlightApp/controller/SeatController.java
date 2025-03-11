package com.example.FlightApp.controller;

import com.example.FlightApp.service.SeatService;
import com.example.FlightApp.model.Seat;
import com.example.FlightApp.model.SeatClass;
import com.example.FlightApp.model.SeatType;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/seats")
@RequiredArgsConstructor
public class SeatController {
    private final SeatService seatService;

    @GetMapping
    public List<Seat> getAllSeats() {
        return seatService.getAllSeats();
    }

    @GetMapping("/{flightId}")
    public List<Seat> getSeatsForFlight(@PathVariable Long flightId) {
        return seatService.getSeatsForAirplane(flightId);
    }

    @GetMapping("/find")
    public Optional<Seat> findSeat(@RequestParam Long flightId,
                                   @RequestParam SeatType preferredType,
                                   @RequestParam SeatClass seatClass) {
        return seatService.findBestSeat(flightId, preferredType, seatClass);
    }
}
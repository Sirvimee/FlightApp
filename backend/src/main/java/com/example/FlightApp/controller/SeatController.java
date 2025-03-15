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

    @GetMapping("/{airplaneId}")
    public List<Seat> getSeatsForFlight(@PathVariable Long airplaneId) {
        return seatService.getSeatsForAirplane(airplaneId);
    }

    @GetMapping("/find")
    public Optional<Seat> findSeat(@RequestParam Long airplaneId,
                                   @RequestParam SeatType preferredType,
                                   @RequestParam SeatClass seatClass) {
        return seatService.findBestSeat(airplaneId, preferredType, seatClass);
    }
}
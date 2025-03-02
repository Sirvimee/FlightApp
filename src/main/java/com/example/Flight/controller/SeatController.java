package com.example.Flight.controller;

import com.example.Flight.Service.SeatService;
import com.example.Flight.model.Seat;
import com.example.Flight.model.SeatClass;
import com.example.Flight.model.SeatType;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/seats")
@RequiredArgsConstructor
public class SeatController {
    private final SeatService seatService;

    @GetMapping("/{flightId}")
    public List<Seat> getSeatsForFlight(@PathVariable Long flightId) {
        return seatService.getSeatsForFlight(flightId);
    }

    @GetMapping("/find")
    public Optional<Seat> findSeat(@RequestParam Long flightId,
                                   @RequestParam SeatType preferredType,
                                   @RequestParam SeatClass seatClass) {
        return seatService.findBestSeat(flightId, preferredType, seatClass);
    }
}
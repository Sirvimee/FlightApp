package com.example.FlightApp.controller;

import com.example.FlightApp.model.Seat;
import com.example.FlightApp.service.ReservationService;
import com.example.FlightApp.model.Reservation;
import com.example.FlightApp.model.SeatClass;
import com.example.FlightApp.model.SeatType;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/reservations")
@RequiredArgsConstructor
public class ReservationController {
    private final ReservationService reservationService;

    @PostMapping
    public Reservation createReservation(@RequestBody Reservation reservation, @RequestParam List<Long> seatIds) {
        return reservationService.bookSeats(reservation, seatIds);
    }
    
}

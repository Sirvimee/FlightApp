package com.example.FlightApp.controller;

import com.example.FlightApp.model.*;
import com.example.FlightApp.service.ReservationService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/reservations")
@RequiredArgsConstructor
public class ReservationController {

    private final ReservationService reservationService;

    @PostMapping(consumes = "application/json")
    public ResponseEntity<Reservation> createReservation(
            @RequestBody Reservation reservation,
            @RequestParam List<Long> seatIds) {

        Reservation savedReservation = reservationService.bookSeats(reservation, seatIds);
        return ResponseEntity.status(HttpStatus.CREATED).body(savedReservation);
    }
    
}

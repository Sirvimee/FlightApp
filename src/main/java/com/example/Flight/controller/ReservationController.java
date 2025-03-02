package com.example.Flight.controller;

import com.example.Flight.Service.ReservationService;
import com.example.Flight.model.Reservation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/reservations")
@RequiredArgsConstructor
public class ReservationController {
    private final ReservationService reservationService;

    @GetMapping
    public Iterable<Reservation> getAllReservations() {
        return reservationService.getAllReservations();
    }

    @PostMapping("/book")
    public Reservation bookSeats(@RequestParam Long flightId,
                                 @RequestParam String passengerName,
                                 @RequestParam int numberOfSeats) {
        return reservationService.bookSeats(flightId, passengerName, numberOfSeats);
    }
}

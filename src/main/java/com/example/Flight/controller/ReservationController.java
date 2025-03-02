package com.example.Flight.controller;

import com.example.Flight.Service.ReservationService;
import com.example.Flight.model.Reservation;
import com.example.Flight.model.SeatClass;
import com.example.Flight.model.SeatType;
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
                                 @RequestParam int numberOfSeats,
                                 @RequestParam SeatType preferredType,
                                 @RequestParam SeatClass seatClass) {
        return reservationService.bookSeats(flightId, passengerName, numberOfSeats, preferredType, seatClass);
    }
}

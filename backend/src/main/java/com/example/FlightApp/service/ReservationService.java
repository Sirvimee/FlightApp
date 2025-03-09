package com.example.FlightApp.service;

import com.example.FlightApp.model.*;
import com.example.FlightApp.repository.FlightRepository;
import com.example.FlightApp.repository.ReservationRepository;
import com.example.FlightApp.repository.SeatRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReservationService {
    private final ReservationRepository reservationRepository;
    private final SeatRepository seatRepository;

    public Reservation bookSeats(Reservation reservation, List<Long> seatsId ) {
        List<Seat> seats = seatRepository.findAllById(seatsId);
        for (Seat seat : seats) {
            if (!seat.isAvailable()) {
                throw new RuntimeException("Seat " + seat.getId() + " is not available");
            }
        }

        for (Seat seat : seats) {
            seat.setAvailable(false);
        }

        seatRepository.saveAll(seats);
        reservation.setSeats(seats);
        return reservationRepository.save(reservation);
    }

}

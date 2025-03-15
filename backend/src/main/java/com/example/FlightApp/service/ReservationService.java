package com.example.FlightApp.service;

import com.example.FlightApp.model.*;
import com.example.FlightApp.repository.ReservationRepository;
import com.example.FlightApp.repository.ReservationSeatRepository;
import com.example.FlightApp.repository.SeatRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReservationService {

    private final ReservationRepository reservationRepository;
    private final SeatRepository seatRepository;
    private final ReservationSeatRepository reservationSeatRepository;

    @Transactional
    public Reservation bookSeats(Reservation reservation, List<Long> seatIds) {

        Reservation savedReservation = reservationRepository.save(reservation);

        List<Seat> seats = seatRepository.findAllById(seatIds);


        for (Seat seat : seats) {
            seat.setAvailable(false);
            ReservationSeat reservationSeat = new ReservationSeat();
            reservationSeat.setReservation(savedReservation);
            reservationSeat.setSeat(seat);
            reservationSeatRepository.save(reservationSeat);
        }

        seatRepository.saveAll(seats);
        return savedReservation;
    }

}

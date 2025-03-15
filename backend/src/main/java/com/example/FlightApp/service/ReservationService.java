package com.example.FlightApp.service;

import com.example.FlightApp.model.*;
import com.example.FlightApp.repository.*;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReservationService {

    private final ReservationRepository reservationRepository;
    private final ReservationSeatRepository reservationSeatRepository;
    private final FlightSeatRepository flightSeatRepository;

    @Transactional
    public Reservation bookSeats(Reservation reservation, List<Long> seatIds) {

        Reservation savedReservation = reservationRepository.save(reservation);
        Flight flight = reservation.getFlight();
        List<FlightSeat> flightSeats = flightSeatRepository.findAllById(seatIds);

        for (FlightSeat seat : flightSeats) {
            seat.setAvailable(false);
            seat.setFlight(flight);
            ReservationSeat reservationSeat = new ReservationSeat();
            reservationSeat.setReservation(savedReservation);
            reservationSeat.setFlightSeat(seat);
            reservationSeat.setFlight(flight);
            reservationSeatRepository.save(reservationSeat);
        }
        return savedReservation;
    }
}

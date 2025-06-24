package com.example.FlightApp.service;

import com.example.FlightApp.DTO.ReservationDto;
import com.example.FlightApp.mapper.ReservationMapper;
import com.example.FlightApp.model.*;
import com.example.FlightApp.repository.*;
import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ReservationService {

    private final ReservationRepository reservationRepository;
    private final ReservationSeatRepository reservationSeatRepository;
    private final FlightSeatRepository flightSeatRepository;
    private final ReservationMapper reservationMapper;

    @Transactional
    public Reservation bookSeats(Reservation reservation, List<Long> seatIds) {

        Reservation savedReservation = reservationRepository.save(reservation);
        Flight flight = reservation.getFlight();
        User user = reservation.getUser();
        List<FlightSeat> flightSeats = flightSeatRepository.findAllById(seatIds);

        for (FlightSeat seat : flightSeats) {
            seat.setAvailable(false);
            seat.setFlight(flight);
            ReservationSeat reservationSeat = new ReservationSeat();
            reservationSeat.setReservation(savedReservation);
            reservationSeat.setFlightSeat(seat);
            reservationSeat.setFlight(flight);
            reservationSeat.setUser(user);
            reservationSeatRepository.save(reservationSeat);
        }
        return savedReservation;
    }

    @Transactional
    public Reservation getReservationById(Long id) {
        return reservationRepository.findById(id)
                .orElse(null);
    }

    @Transactional
    public List<ReservationDto> getReservationsByUserId(UUID userId) {
        return reservationRepository.findByUserId(userId).stream()
                .map(reservationMapper::toDto)
                .collect(Collectors.toList());
    }

    @Transactional
    public void deleteReservationById(Long id) {
        Reservation reservation = reservationRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Reservation not found with ID: " + id));

        for (ReservationSeat seat : reservation.getReservationSeats()) {
            FlightSeat flightSeat = seat.getFlightSeat();
            flightSeat.setAvailable(true);
            flightSeatRepository.save(flightSeat);
        }
        reservationRepository.delete(reservation);
    }

}

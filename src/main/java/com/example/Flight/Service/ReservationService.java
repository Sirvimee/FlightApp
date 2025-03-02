package com.example.Flight.Service;

import com.example.Flight.model.*;
import com.example.Flight.repository.FlightRepository;
import com.example.Flight.repository.ReservationRepository;
import com.example.Flight.repository.SeatRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ReservationService {
    private final ReservationRepository reservationRepository;
    private final FlightRepository flightRepository;
    private final SeatRepository seatRepository;

    public Reservation bookSeats(Long flightId, String passengerName, int numberOfSeats, SeatType preferredType, SeatClass seatClass) {
        Flight flight = flightRepository.findById(flightId)
                .orElseThrow(() -> new RuntimeException("Flight not found"));

        List<Seat> availableSeats = seatRepository.findAll().stream()
                .filter(seat -> seat.getFlight().getId().equals(flightId)
                        && seat.isAvailable()
                        && seat.getSeatType() == preferredType
                        && seat.getSeatClass() == seatClass)
                .limit(numberOfSeats)
                .collect(Collectors.toList());

        if (availableSeats.size() < numberOfSeats) {
            throw new RuntimeException("Not enough available seats in the selected category");
        }

        availableSeats.forEach(seat -> seat.setAvailable(false));
        seatRepository.saveAll(availableSeats);

        Reservation reservation = new Reservation();
        reservation.setPassengerName(passengerName);
        reservation.setNumberOfSeats(numberOfSeats);
        reservation.setFlight(flight);
        reservation.setSeats(availableSeats);

        return reservationRepository.save(reservation);
    }

    public Iterable<Reservation> getAllReservations() {
        return reservationRepository.findAll();
    }
}

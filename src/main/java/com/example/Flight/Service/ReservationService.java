package com.example.Flight.Service;

import com.example.Flight.model.Flight;
import com.example.Flight.model.Reservation;
import com.example.Flight.model.Seat;
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

    public Reservation bookSeats(Long flightId, String passengerName, int numberOfSeats) {
        Flight flight = flightRepository.findById(flightId)
                .orElseThrow(() -> new RuntimeException("Flight not found"));

        List<Seat> availableSeats = seatRepository.findAll().stream()
                .filter(seat -> seat.getFlight().getId().equals(flightId) && seat.isAvailable())
                .limit(numberOfSeats)
                .collect(Collectors.toList());

        if (availableSeats.size() < numberOfSeats) {
            throw new RuntimeException("Not enough available seats");
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

package com.example.Flight.Service;

import com.example.Flight.model.Seat;
import com.example.Flight.model.SeatClass;
import com.example.Flight.model.SeatType;
import com.example.Flight.repository.SeatRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class SeatService {
    private final SeatRepository seatRepository;

    public List<Seat> getSeatsForFlight(Long flightId) {
        return seatRepository.findAll().stream()
                .filter(seat -> seat.getFlight().getId().equals(flightId))
                .toList();
    }

    public Optional<Seat> findBestSeat(Long flightId, SeatType preferredType, SeatClass seatClass) {
        return seatRepository.findAll().stream()
                .filter(seat -> seat.getFlight().getId().equals(flightId)
                        && seat.isAvailable()
                        && seat.getSeatType() == preferredType
                        && seat.getSeatClass() == seatClass)
                .findFirst();
    }
}
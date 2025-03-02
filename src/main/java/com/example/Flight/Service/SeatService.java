package com.example.Flight.Service;

import com.example.Flight.model.Seat;
import com.example.Flight.repository.SeatRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SeatService {
    private final SeatRepository seatRepository;

    public List<Seat> getSeatsForFlight(Long flightId) {
        return seatRepository.findAll().stream()
                .filter(seat -> seat.getFlight().getId().equals(flightId))
                .toList();
    }
}

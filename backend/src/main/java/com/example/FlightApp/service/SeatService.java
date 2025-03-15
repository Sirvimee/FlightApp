package com.example.FlightApp.service;

import com.example.FlightApp.model.Seat;
import com.example.FlightApp.model.SeatClass;
import com.example.FlightApp.model.SeatType;
import com.example.FlightApp.repository.SeatRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class SeatService {
    private final SeatRepository seatRepository;

    public List<Seat> getSeatsForAirplane(Long airplaneId) {
        return seatRepository.findAll().stream()
                .filter(seat -> seat.getAirplane().getId().equals(airplaneId))
                .toList();
    }

    public Optional<Seat> findBestSeat(Long airplaneId, SeatType preferredType, SeatClass seatClass) {
        return seatRepository.findAll().stream()
                .filter(seat -> seat.getAirplane().getId().equals(airplaneId)
                        && seat.isAvailable()
                        && seat.getSeatType() == preferredType
                        && seat.getSeatClass() == seatClass)
                .findFirst();
    }

    public List<Seat> getAllSeats() {
        return seatRepository.findAll();
    }
}
package com.example.FlightApp.service;


import com.example.FlightApp.model.AirplaneSeat;
import com.example.FlightApp.model.FlightSeat;
import com.example.FlightApp.model.Seat;

import com.example.FlightApp.repository.AirplaneSeatRepository;
import com.example.FlightApp.repository.FlightSeatRepository;
import com.example.FlightApp.repository.SeatRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SeatService {

    private final SeatRepository seatRepository;
    private final FlightSeatRepository flightSeatRepository;
    private final AirplaneSeatRepository airplaneSeatRepository;

    public List<AirplaneSeat> getSeatsForAirplane(Long airplaneId) {
        return airplaneSeatRepository.findAll().stream()
                .filter(airplaneSeat -> airplaneSeat.getAirplane().getId().equals(airplaneId))
                .toList();
    }

    public List<FlightSeat> getSeatsForFlight(Long flightId) {
        return flightSeatRepository.findAll().stream()
                .filter(flightSeat -> flightSeat.getFlight().getId().equals(flightId))
                .toList();
    }

    public List<Seat> getAllSeats() {
        return seatRepository.findAll();
    }

    public Seat getSeatById(Long id) {
        return seatRepository.findById(id).orElseThrow(() -> new RuntimeException("Seat not found"));
    }
}
package com.example.FlightApp.mapper;

import com.example.FlightApp.DTO.*;
import com.example.FlightApp.model.*;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class ReservationMapper {

    public FlightInfoDto toFlightInfoDto(Flight flight) {
        FlightInfoDto dto = new FlightInfoDto();
        dto.setId(flight.getId());
        dto.setFlightNumber(flight.getId());
        dto.setDate(flight.getDate());
        dto.setAirline(flight.getAirline());
        dto.setArrivalAirport(flight.getDestination());
        dto.setDepartureTime(flight.getDepartureTime());
        dto.setArrivalTime(flight.getArrivalTime());
        return dto;
    }

    public ReservationDto toDto(Reservation reservation) {
        ReservationDto dto = new ReservationDto();
        dto.setId(reservation.getId());
        dto.setFlightInfo(toFlightInfoDto(reservation.getFlight()));

        List<ReservationSeatDto> seatDtos = reservation.getReservationSeats()
                .stream()
                .map(this::toDto)
                .collect(Collectors.toList());

        dto.setReservationSeats(seatDtos);
        return dto;
    }

    public ReservationSeatDto toDto(ReservationSeat reservationSeat) {
        ReservationSeatDto dto = new ReservationSeatDto();
        dto.setId(reservationSeat.getId());
        dto.setFlightSeat(toDto(reservationSeat.getFlightSeat()));
        return dto;
    }

    public FlightSeatDto toDto(FlightSeat flightSeat) {
        FlightSeatDto dto = new FlightSeatDto();
        dto.setId(flightSeat.getId());
        dto.setSeatNumber(flightSeat.getSeat().getSeatNumber());
        dto.setAvailable(flightSeat.isAvailable());
        return dto;
    }
}

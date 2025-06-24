package com.example.FlightApp.DTO;

import lombok.Data;

import java.util.List;

@Data
public class ReservationDto {
    private Long id;
    private FlightInfoDto flightInfo;
    private List<ReservationSeatDto> reservationSeats;
}

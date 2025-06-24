package com.example.FlightApp.DTO;

import lombok.Data;

@Data
public class ReservationSeatDto {
    private Long id;
    private FlightSeatDto flightSeat;
}

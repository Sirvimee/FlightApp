package com.example.FlightApp.DTO;

import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Data
public class FlightInfoDto {
    private Long id;
    private LocalDate date;
    private Long flightNumber;
    private String airline;
    private String arrivalAirport;
    private LocalTime departureTime;
    private LocalDateTime arrivalTime;
}

package com.example.FlightApp.DTO;

import lombok.Data;

@Data
public class FlightSeatDto {
    private Long id;
    private String seatNumber;
    private boolean available;
}

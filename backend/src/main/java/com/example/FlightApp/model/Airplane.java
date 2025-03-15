package com.example.FlightApp.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Airplane {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String model;
    private int capacity;

    @JsonIgnore
    @OneToMany(mappedBy = "airplane")
    private List<Seat> seats;

    @JsonIgnore
    @OneToMany(mappedBy = "airplane")
    private List<Flight> flights;

}

package com.example.FlightApp.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
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

    @JsonManagedReference
    @OneToMany(mappedBy = "airplane", fetch = FetchType.EAGER)
    private List<Seat> seats;

    @JsonBackReference
    @OneToMany(mappedBy = "airplane", fetch = FetchType.EAGER)
    private List<Flight> flights;
}

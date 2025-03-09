package com.example.FlightApp.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Seat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @Column(name = "seat_number")
    private String seatNumber;

    @Enumerated(EnumType.STRING)
    @Column(name = "seat_type")
    private SeatType seatType;

    @Enumerated(EnumType.STRING)
    @Column(name = "seat_class")
    private SeatClass seatClass;

    @Column(name = "extra_legroom")
    private boolean extraLegroom;

    @Column(name = "exit_row")
    private boolean exitRow;

    @Column(name = "is_available")
    private boolean isAvailable;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "airplane_id")
    private Airplane airplane;

    @JsonManagedReference
    @ManyToOne
    @JoinColumn(name = "reservation_id")
    private Reservation reservation;
}
package com.example.FlightApp.repository;

import com.example.FlightApp.model.Reservation;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Long> {
    @EntityGraph(attributePaths = {"reservationSeats", "reservationSeats.flightSeat"})
    List<Reservation> findByUserId(UUID userId);
}
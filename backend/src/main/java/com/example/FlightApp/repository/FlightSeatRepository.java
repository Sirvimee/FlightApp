package com.example.FlightApp.repository;

import com.example.FlightApp.model.FlightSeat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FlightSeatRepository extends JpaRepository<FlightSeat, Long> {
}

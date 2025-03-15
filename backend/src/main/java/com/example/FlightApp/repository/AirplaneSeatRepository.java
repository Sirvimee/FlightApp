package com.example.FlightApp.repository;

import com.example.FlightApp.model.AirplaneSeat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AirplaneSeatRepository extends JpaRepository<AirplaneSeat, Long> {
}

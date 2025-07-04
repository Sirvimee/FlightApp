package com.example.FlightApp.repository;

import com.example.FlightApp.model.Flight;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FlightRepository extends JpaRepository<Flight, Long> {
    List<Flight> findAllByOrderByDateAscDepartureTimeAsc();
}
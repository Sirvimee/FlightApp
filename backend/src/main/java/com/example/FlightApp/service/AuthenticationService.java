package com.example.FlightApp.service;

import com.example.FlightApp.model.RegisterRequest;
import com.example.FlightApp.model.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

@Service
public interface AuthenticationService {
    UserDetails authenticate(String email, String password);
    String generateToken(UserDetails userDetails);
    UserDetails validateToken(String token);

    User register(RegisterRequest request);
}

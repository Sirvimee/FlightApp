package com.example.FlightApp.controller;

import com.example.FlightApp.model.AuthResponse;
import com.example.FlightApp.model.LoginRequest;
import com.example.FlightApp.model.RegisterRequest;
import com.example.FlightApp.model.User;
import com.example.FlightApp.service.AuthenticationService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping
@RequiredArgsConstructor
public class AuthController {

    private final AuthenticationService authenticationService;

    @PostMapping("/api/login")
    public ResponseEntity<AuthResponse> login(@RequestBody LoginRequest loginRequest) {
        UserDetails userDetails = authenticationService.authenticate(
                loginRequest.getEmail(),
                loginRequest.getPassword()
        );
        String tokenValue = authenticationService.generateToken(userDetails);
        User user = authenticationService.getUserByEmail(loginRequest.getEmail());
        return ResponseEntity.ok(buildAuthResponse(tokenValue, user));
    }

    @PostMapping("/api/register")
    public ResponseEntity<AuthResponse> register(@Valid @RequestBody RegisterRequest registerRequest) {

        authenticationService.register(registerRequest);

        UserDetails userDetails = authenticationService.authenticate(
                registerRequest.getEmail(),
                registerRequest.getPassword()
        );
        String token = authenticationService.generateToken(userDetails);
        User user = authenticationService.getUserByEmail(registerRequest.getEmail());
        return ResponseEntity.status(201).body(buildAuthResponse(token, user));
    }

    private AuthResponse buildAuthResponse(String token, User user) {
        return AuthResponse.builder()
                .token(token)
                .expiresIn(86400)
                .user(user)
                .build();
    }
}

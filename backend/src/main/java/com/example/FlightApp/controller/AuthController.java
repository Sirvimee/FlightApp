package com.example.FlightApp.controller;

import com.example.FlightApp.model.AuthResponse;
import com.example.FlightApp.model.LoginRequest;
import com.example.FlightApp.model.RegisterRequest;
import com.example.FlightApp.service.AuthenticationService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
@RequiredArgsConstructor
public class AuthController {

    private final AuthenticationService authenticationService;

    @PostMapping("/login")
    public ResponseEntity<AuthResponse> login(@RequestBody LoginRequest loginRequest) {
        UserDetails userDetails = authenticationService.authenticate(
                loginRequest.getEmail(),
                loginRequest.getPassword()
        );
        String tokenValue = authenticationService.generateToken(userDetails);
        return ResponseEntity.ok(buildAuthResponse(tokenValue));
    }

    @PostMapping("/register")
    public ResponseEntity<AuthResponse> register(@Valid @RequestBody RegisterRequest registerRequest) {

        authenticationService.register(registerRequest);

        UserDetails userDetails = authenticationService.authenticate(
                registerRequest.getEmail(),
                registerRequest.getPassword()
        );
        String token = authenticationService.generateToken(userDetails);

        return ResponseEntity.status(201).body(buildAuthResponse(token));
    }

    private AuthResponse buildAuthResponse(String token) {
        return AuthResponse.builder()
                .token(token)
                .expiresIn(86400)
                .build();
    }
}

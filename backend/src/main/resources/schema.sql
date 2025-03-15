CREATE TABLE Airplane (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(255),
    capacity INT
);

CREATE TABLE Seat (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    seat_number VARCHAR(255),
    seat_type VARCHAR(255),
    seat_class VARCHAR(255),
    extra_legroom BOOLEAN,
    exit_row BOOLEAN
);

CREATE TABLE Airplane_seat (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    airplane_id BIGINT,
    seat_id BIGINT,
    FOREIGN KEY (airplane_id) REFERENCES Airplane(id),
    FOREIGN KEY (seat_id) REFERENCES Seat(id)
);

CREATE TABLE Flight (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    airline VARCHAR(255),
    destination VARCHAR(255),
    departure_time TIME,
    arrival_time TIMESTAMP,
    price DOUBLE,
    airplane_id BIGINT,
    FOREIGN KEY (airplane_id) REFERENCES Airplane(id)
);

CREATE TABLE Flight_seat (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    available BOOLEAN,
    flight_id BIGINT,
    seat_id BIGINT,
    FOREIGN KEY (flight_id) REFERENCES Flight(id),
    FOREIGN KEY (seat_id) REFERENCES Seat(id)
);

CREATE TABLE Reservation (
     id BIGINT AUTO_INCREMENT PRIMARY KEY,
     passenger_name VARCHAR(255),
     flight_id BIGINT,
     FOREIGN KEY (flight_id) REFERENCES Flight(id)
);

CREATE TABLE Reservation_seat (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    reservation_id BIGINT,
    flight_seat_id BIGINT,
    flight_id BIGINT,
    FOREIGN KEY (reservation_id) REFERENCES Reservation(id),
    FOREIGN KEY (flight_seat_id) REFERENCES Flight_seat(id),
    FOREIGN KEY (flight_id) REFERENCES Flight(id)
);
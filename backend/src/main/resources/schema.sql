DROP TABLE IF EXISTS Reservation_Seat;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Seat;
DROP TABLE IF EXISTS Flight;
DROP TABLE IF EXISTS Airplane;

CREATE TABLE Airplane (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(255) NOT NULL,
    capacity INT NOT NULL
);

CREATE TABLE Flight (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    airline VARCHAR(255) NOT NULL,
    destination VARCHAR(255) NOT NULL,
    departure_time TIME NOT NULL,
    arrival_time TIMESTAMP NOT NULL,
    price DOUBLE NOT NULL,
    airplane_id BIGINT,
    FOREIGN KEY (airplane_id) REFERENCES Airplane(id)
);

CREATE TABLE Seat (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    seat_number VARCHAR(10) NOT NULL,
    seat_type VARCHAR(50) NOT NULL,
    seat_class VARCHAR(50) NOT NULL,
    extra_legroom BOOLEAN NOT NULL,
    exit_row BOOLEAN NOT NULL,
    is_available BOOLEAN NOT NULL,
    airplane_id BIGINT,
    FOREIGN KEY (airplane_id) REFERENCES Airplane(id)
);

CREATE TABLE Reservation (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    passenger_name VARCHAR(255) NOT NULL,
    flight_id BIGINT,
    FOREIGN KEY (flight_id) REFERENCES Flight(id)
);

CREATE TABLE Reservation_Seat (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    reservation_id BIGINT,
    seat_id BIGINT,
    FOREIGN KEY (reservation_id) REFERENCES Reservation(id),
    FOREIGN KEY (seat_id) REFERENCES Seat(id)
);
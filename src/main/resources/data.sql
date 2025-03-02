-- Loodud AI abiga

CREATE TABLE flight
(
    id             INT PRIMARY KEY,
    airline        VARCHAR(255),
    departure      VARCHAR(255),
    destination    VARCHAR(255),
    departure_time TIMESTAMP,
    price          DECIMAL(10, 2)
);

CREATE TABLE seat
(
    id           INT PRIMARY KEY,
    seat_number  VARCHAR(10),
    is_available BOOLEAN,
    seat_type    VARCHAR(50),
    seat_class   VARCHAR(50),
    flight_id    INT,
    FOREIGN KEY (flight_id) REFERENCES flight (id)
);

CREATE TABLE reservation
(
    id              INT PRIMARY KEY,
    passenger_name  VARCHAR(255),
    number_of_seats INT,
    flight_id       INT,
    FOREIGN KEY (flight_id) REFERENCES flight (id)
);

CREATE TABLE reservation_seats
(
    reservation_id INT,
    seats_id       INT,
    PRIMARY KEY (reservation_id, seats_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation (id),
    FOREIGN KEY (seats_id) REFERENCES seat (id)
);

-- Adding flights
INSERT INTO flight (id, airline, departure, destination, departure_time, price)
VALUES (1, 'FL123', 'Tallinn', 'London', '2025-03-15 08:00:00', 120.00),
       (2, 'FL456', 'Tallinn', 'Paris', '2025-03-16 12:30:00', 150.00),
       (3, 'FL789', 'Tallinn', 'Berlin', '2025-03-17 15:45:00', 90.00);

-- Adding seats for flight 1
INSERT INTO seat (id, seat_number, is_available, seat_type, seat_class, flight_id)
VALUES (1, '1A', true, 'WINDOW', 'FIRST_CLASS', 1),
       (2, '1B', false, 'AISLE', 'FIRST_CLASS', 1), -- Occupied seat
       (3, '2A', true, 'WINDOW', 'BUSINESS', 1),
       (4, '2B', true, 'AISLE', 'BUSINESS', 1),
       (5, '3A', false, 'WINDOW', 'ECONOMY', 1),    -- Occupied seat
       (6, '3B', true, 'AISLE', 'ECONOMY', 1),
       (7, '3C', true, 'EXTRA_LEGROOM', 'ECONOMY', 1),
       (8, '4A', true, 'WINDOW', 'ECONOMY', 1);

-- Adding seats for flight 2
INSERT INTO seat (id, seat_number, is_available, seat_type, seat_class, flight_id)
VALUES (9, '1A', false, 'WINDOW', 'FIRST_CLASS', 2), -- Occupied seat
       (10, '1B', true, 'AISLE', 'FIRST_CLASS', 2),
       (11, '2A', true, 'WINDOW', 'BUSINESS', 2),
       (12, '2B', true, 'AISLE', 'BUSINESS', 2),
       (13, '3A', true, 'WINDOW', 'ECONOMY', 2),
       (14, '3B', false, 'AISLE', 'ECONOMY', 2);
-- Occupied seat

-- Adding seats for flight 3
INSERT INTO seat (id, seat_number, is_available, seat_type, seat_class, flight_id)
VALUES (15, '1A', true, 'WINDOW', 'FIRST_CLASS', 3),
       (16, '1B', true, 'AISLE', 'FIRST_CLASS', 3),
       (17, '2A', false, 'WINDOW', 'BUSINESS', 3), -- Occupied seat
       (18, '2B', true, 'AISLE', 'BUSINESS', 3),
       (19, '3A', true, 'WINDOW', 'ECONOMY', 3),
       (20, '3B', true, 'AISLE', 'ECONOMY', 3);

-- Adding reservations (Occupied seats)
INSERT INTO reservation (id, passenger_name, number_of_seats, flight_id)
VALUES (1, 'John Doe', 1, 1),
       (2, 'Jane Smith', 1, 1),
       (3, 'Alice Brown', 1, 2),
       (4, 'Bob White', 1, 3);

-- Linking reservations and seats
INSERT INTO reservation_seats (reservation_id, seats_id)
VALUES (1, 2),
       (2, 5),
       (3, 9),
       (4, 17);
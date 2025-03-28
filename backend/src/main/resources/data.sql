-- AI genereeritud SQL skript

-- Insert Airplanes
INSERT INTO Airplane (model, capacity) VALUES
    ('Boeing 737', 200),
    ('Airbus A320', 180);

-- Insert seats
-- First Class (4 rows, 2 seats per row)
INSERT INTO Seat (seat_number, seat_type, seat_class, extra_legroom, exit_row) VALUES
    ('1A', 'WINDOW', 'FIRST_CLASS', false, false),
    ('2B', 'AISLE', 'FIRST_CLASS', false, false),
    ('3E', 'AISLE', 'FIRST_CLASS', false, false),
    ('4F', 'WINDOW', 'FIRST_CLASS', false, false),
    ('5A', 'WINDOW', 'FIRST_CLASS', false, false),
    ('6B', 'AISLE', 'FIRST_CLASS', false, false),
    ('7E', 'AISLE', 'FIRST_CLASS', false, false),
    ('8F', 'WINDOW', 'FIRST_CLASS', false, false),
    ('9A', 'WINDOW', 'FIRST_CLASS', false, false),
    ('10B', 'AISLE', 'FIRST_CLASS', false, false),
    ('11E', 'AISLE', 'FIRST_CLASS', false, false),
    ('12F', 'WINDOW', 'FIRST_CLASS', false, false),
    ('13A', 'WINDOW', 'FIRST_CLASS', false, false),
    ('14B', 'AISLE', 'FIRST_CLASS', false, false),
    ('15E', 'AISLE', 'FIRST_CLASS', false, false),
    ('16F', 'WINDOW', 'FIRST_CLASS', false, false);

-- Business Class (4 rows, 2 seats per row)
INSERT INTO Seat (seat_number, seat_type, seat_class, extra_legroom, exit_row) VALUES
    ('17A', 'WINDOW', 'BUSINESS', false, false),
    ('18B', 'AISLE', 'BUSINESS', false, false),
    ('19E', 'AISLE', 'BUSINESS', false, false),
    ('20F', 'WINDOW', 'BUSINESS', false, false),
    ('21A', 'WINDOW', 'BUSINESS', false, false),
    ('22B', 'AISLE', 'BUSINESS', false, false),
    ('23E', 'AISLE', 'BUSINESS', false, false),
    ('24F', 'WINDOW', 'BUSINESS', false, false);

-- Economy Class (9 rows, 6 seats per row)
INSERT INTO Seat (seat_number, seat_type, seat_class, extra_legroom, exit_row) VALUES
    ('25A', 'WINDOW', 'ECONOMY', false, false),
    ('25B', 'STANDARD', 'ECONOMY', false, false),
    ('25C', 'AISLE', 'ECONOMY', false, false),
    ('25D', 'AISLE', 'ECONOMY', false, false),
    ('25E', 'STANDARD', 'ECONOMY', false, false),
    ('25F', 'WINDOW', 'ECONOMY', false, false),
    ('26A', 'WINDOW', 'ECONOMY', false, false),
    ('26B', 'STANDARD', 'ECONOMY', false, false),
    ('26C', 'AISLE', 'ECONOMY', false, false),
    ('26D', 'AISLE', 'ECONOMY', false, false),
    ('26E', 'STANDARD', 'ECONOMY', false, false),
    ('26F', 'WINDOW', 'ECONOMY', false, false),
    ('27A', 'WINDOW', 'ECONOMY', true, false),
    ('27B', 'STANDARD', 'ECONOMY', true, false),
    ('27C', 'AISLE', 'ECONOMY', true, false),
    ('27D', 'AISLE', 'ECONOMY', true, false),
    ('27E', 'STANDARD', 'ECONOMY', true, false),
    ('27F', 'WINDOW', 'ECONOMY', true, false),
    ('28A', 'WINDOW', 'ECONOMY', false, false),
    ('28B', 'STANDARD', 'ECONOMY', false, false),
    ('28C', 'AISLE', 'ECONOMY', false, false),
    ('28D', 'AISLE', 'ECONOMY', false, false),
    ('28E', 'STANDARD', 'ECONOMY', false, false),
    ('28F', 'WINDOW', 'ECONOMY', false, false),
    ('29A', 'WINDOW', 'ECONOMY', false, false),
    ('29B', 'STANDARD', 'ECONOMY', false, false),
    ('29C', 'AISLE', 'ECONOMY', false, false),
    ('29D', 'AISLE', 'ECONOMY', false, false),
    ('29E', 'STANDARD', 'ECONOMY', false, false),
    ('29F', 'WINDOW', 'ECONOMY', false, false),
    ('30A', 'WINDOW', 'ECONOMY', false, true),
    ('30B', 'STANDARD', 'ECONOMY', false, true),
    ('30C', 'AISLE', 'ECONOMY', false, true),
    ('30D', 'AISLE', 'ECONOMY', false, true),
    ('30E', 'STANDARD', 'ECONOMY', false, true),
    ('30F', 'WINDOW', 'ECONOMY', false, true),
    ('31A', 'WINDOW', 'ECONOMY', false, false),
    ('31B', 'STANDARD', 'ECONOMY', false, false),
    ('31C', 'AISLE', 'ECONOMY', false, false),
    ('31D', 'AISLE', 'ECONOMY', false, false),
    ('31E', 'STANDARD', 'ECONOMY', false, false),
    ('31F', 'WINDOW', 'ECONOMY', false, false),
    ('32A', 'WINDOW', 'ECONOMY', false, false),
    ('32B', 'STANDARD', 'ECONOMY', false, false),
    ('32C', 'AISLE', 'ECONOMY', false, false),
    ('32D', 'AISLE', 'ECONOMY', false, false),
    ('32E', 'STANDARD', 'ECONOMY', false, false),
    ('32F', 'WINDOW', 'ECONOMY', false, false),
    ('33A', 'WINDOW', 'ECONOMY', false, false),
    ('33B', 'STANDARD', 'ECONOMY', false, false),
    ('33C', 'AISLE', 'ECONOMY', false, false),
    ('33D', 'AISLE', 'ECONOMY', false, false),
    ('33E', 'STANDARD', 'ECONOMY', false, false),
    ('33F', 'WINDOW', 'ECONOMY', false, false);

-- Insert AirplaneSeats
INSERT INTO Airplane_seat (airplane_id, seat_id) VALUES
    (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10), (1, 11), (1, 12),
    (1, 13), (1, 14), (1, 15), (1, 16), (1, 17), (1, 18), (1, 19), (1, 20), (1, 21), (1, 22), (1, 23),
    (1, 24), (1, 25), (1, 26), (1, 27), (1, 28), (1, 29), (1, 30), (1, 31), (1, 32), (1, 33), (1, 34),
    (1, 35), (1, 36), (1, 37), (1, 38), (1, 39), (1, 40), (1, 41), (1, 42), (1, 43), (1, 44), (1, 45),
    (1, 46), (1, 47), (1, 48), (1, 49), (1, 50), (1, 51), (1, 52), (1, 53), (1, 54), (1, 55), (1, 56),
    (1, 57), (1, 58), (1, 59), (1, 60), (1, 61), (1, 62), (1, 63), (1, 64), (1, 65), (1, 66), (1, 67),
    (1, 68), (1, 69), (1, 70), (1, 71), (1, 72), (1, 73), (1, 74), (1, 75), (1, 76), (1, 77), (1, 78),
    (2, 1), (2, 2), (2, 3), (2, 4), (2, 5), (2, 6), (2, 7), (2, 8),
    (2, 9), (2, 10), (2, 11), (2, 12), (2, 13), (2, 14), (2, 15), (2, 16), (2, 17), (2, 18), (2, 19),
    (2, 20), (2, 21), (2, 22), (2, 23), (2, 24), (2, 25), (2, 26), (2, 27), (2, 28), (2, 29), (2, 30),
    (2, 31), (2, 32), (2, 33), (2, 34), (2, 35), (2, 36), (2, 37), (2, 38), (2, 39), (2, 40), (2, 41),
    (2, 42), (2, 43), (2, 44), (2, 45), (2, 46), (2, 47), (2, 48), (2, 49), (2, 50), (2, 51), (2, 52),
    (2, 53), (2, 54), (2, 55), (2, 56), (2, 57), (2, 58), (2, 59), (2, 60), (2, 61), (2, 62), (2, 63),
    (2, 64), (2, 65), (2, 66), (2, 67), (2, 68), (2, 69), (2, 70), (2, 71), (2, 72), (2, 73), (2, 74),
    (2, 75), (2, 76), (2, 77), (2, 78);


-- Insert Flights
INSERT INTO Flight (date, airline, destination, departure_time, arrival_time, price, airplane_id) VALUES
    ('2025-03-14', 'Lufthansa', 'Berlin', '10:00:00', '2025-03-14 12:00:00', 150.0, 1),
    ('2025-03-15', 'Emirates', 'Dubai', '14:00:00', '2025-03-15 16:00:00', 200.0, 2),
    ('2025-03-16', 'Qatar Airways', 'Doha', '08:00:00', '2025-03-16 10:00:00', 180.0, 1),
    ('2025-03-17', 'Singapore Airlines', 'Singapore', '09:00:00', '2025-03-17 11:00:00', 170.0, 2),
    ('2025-03-18', 'British Airways', 'London', '11:00:00', '2025-03-18 13:00:00', 160.0, 1),
    ('2025-03-19', 'Air France', 'Paris', '12:00:00', '2025-03-19 14:00:00', 190.0, 2),
    ('2025-03-20', 'KLM', 'Amsterdam', '13:00:00', '2025-03-20 15:00:00', 210.0, 1),
    ('2025-03-21', 'Turkish Airlines', 'Istanbul', '14:00:00', '2025-03-21 16:00:00', 220.0, 2),
    ('2025-03-22', 'Swiss International Air Lines', 'Zurich', '15:00:00', '2025-03-22 17:00:00', 230.0, 1),
    ('2025-03-23', 'Cathay Pacific', 'Hong Kong', '16:00:00', '2025-03-23 18:00:00', 240.0, 2),
    ('2025-03-24', 'Japan Airlines', 'Tokyo', '17:00:00', '2025-03-24 19:00:00', 250.0, 1),
    ('2025-03-25', 'Qantas', 'Sydney', '18:00:00', '2025-03-25 20:00:00', 260.0, 2);

-- Insert FlightSeats
INSERT INTO Flight_seat (available, flight_id, seat_id) VALUES
    (true, 1, 1), (false, 1, 2), (true, 1, 3), (true, 1, 4), (false, 1, 5),
    (true, 1, 6), (true, 1, 7), (false, 1, 8), (true, 1, 9), (true, 1, 10),
    (false, 1, 11), (true, 1, 12), (true, 1, 13), (false, 1, 14), (true, 1, 15),
    (true, 1, 16), (false, 1, 17), (true, 1, 18), (true, 1, 19), (false, 1, 20),
    (true, 1, 21), (true, 1, 22), (false, 1, 23), (true, 1, 24), (true, 1, 25),
    (false, 1, 26), (true, 1, 27), (true, 1, 28), (false, 1, 29), (true, 1, 30),
    (true, 1, 31), (false, 1, 32), (true, 1, 33), (true, 1, 34), (false, 1, 35),
    (true, 1, 36), (true, 1, 37), (false, 1, 38), (true, 1, 39), (true, 1, 40),
    (false, 1, 41), (true, 1, 42), (true, 1, 43), (false, 1, 44), (true, 1, 45),
    (true, 1, 46), (false, 1, 47), (true, 1, 48), (true, 1, 49), (false, 1, 50),
    (true, 1, 51), (true, 1, 52), (false, 1, 53), (true, 1, 54), (true, 1, 55),
    (false, 1, 56), (true, 1, 57), (true, 1, 58), (false, 1, 59), (true, 1, 60),
    (true, 1, 61), (false, 1, 62), (true, 1, 63), (true, 1, 64), (false, 1, 65),
    (true, 1, 66), (true, 1, 67), (false, 1, 68), (true, 1, 69), (true, 1, 70),
    (false, 1, 71), (true, 1, 72), (true, 1, 73), (false, 1, 74), (true, 1, 75),
    (true, 1, 76), (false, 1, 77), (true, 1, 78), (true, 2, 1), (true, 2, 2), (false, 2, 3),
    (true, 2, 4), (true, 2, 5), (false, 2, 6), (true, 2, 7), (true, 2, 8),
    (false, 2, 9), (true, 2, 10), (true, 2, 11), (false, 2, 12), (true, 2, 13),
    (true, 2, 14), (false, 2, 15), (true, 2, 16), (true, 2, 17), (false, 2, 18),
    (true, 2, 19), (true, 2, 20), (false, 2, 21), (true, 2, 22), (true, 2, 23),
    (false, 2, 24), (true, 2, 25), (true, 2, 26), (false, 2, 27), (true, 2, 28),
    (true, 2, 29), (false, 2, 30), (true, 2, 31), (true, 2, 32), (false, 2, 33),
    (true, 2, 34), (true, 2, 35), (false, 2, 36), (true, 2, 37), (true, 2, 38),
    (false, 2, 39), (true, 2, 40), (true, 2, 41), (false, 2, 42), (true, 2, 43),
    (true, 2, 44), (false, 2, 45), (true, 2, 46), (true, 2, 47), (false, 2, 48),
    (true, 2, 49), (true, 2, 50), (false, 2, 51), (true, 2, 52), (true, 2, 53),
    (false, 2, 54), (true, 2, 55), (true, 2, 56), (false, 2, 57), (true, 2, 58),
    (true, 2, 59), (false, 2, 60), (true, 2, 61), (true, 2, 62), (false, 2, 63),
    (true, 2, 64), (true, 2, 65), (false, 2, 66), (true, 2, 67), (true, 2, 68),
    (false, 2, 69), (true, 2, 70), (true, 2, 71), (false, 2, 72), (true, 2, 73),
    (true, 2, 74), (false, 2, 75), (true, 2, 76), (true, 2, 77), (false, 2, 78);

-- Duplicate for flight_id 3 to 12
INSERT INTO Flight_seat (available, flight_id, seat_id) VALUES
    (true, 3, 1), (false, 3, 2), (true, 3, 3), (true, 3, 4), (false, 3, 5),
    (true, 3, 6), (true, 3, 7), (false, 3, 8), (true, 3, 9), (true, 3, 10),
    (false, 3, 11), (true, 3, 12), (true, 3, 13), (false, 3, 14), (true, 3, 15),
    (true, 3, 16), (false, 3, 17), (true, 3, 18), (true, 3, 19), (false, 3, 20),
    (true, 3, 21), (true, 3, 22), (false, 3, 23), (true, 3, 24), (true, 3, 25),
    (false, 3, 26), (true, 3, 27), (true, 3, 28), (false, 3, 29), (true, 3, 30),
    (true, 3, 31), (false, 3, 32), (true, 3, 33), (true, 3, 34), (false, 3, 35),
    (true, 3, 36), (true, 3, 37), (false, 3, 38), (true, 3, 39), (true, 3, 40),
    (false, 3, 41), (true, 3, 42), (true, 3, 43), (false, 3, 44), (true, 3, 45),
    (true, 3, 46), (false, 3, 47), (true, 3, 48), (true, 3, 49), (false, 3, 50),
    (true, 3, 51), (true, 3, 52), (false, 3, 53), (true, 3, 54), (true, 3, 55),
    (false, 3, 56), (true, 3, 57), (true, 3, 58), (false, 3, 59), (true, 3, 60),
    (true, 3, 61), (false, 3, 62), (true, 3, 63), (true, 3, 64), (false, 3, 65),
    (true, 3, 66), (true, 3, 67), (false, 3, 68), (true, 3, 69), (true, 3, 70),
    (false, 3, 71), (true, 3, 72), (true, 3, 73), (false, 3, 74), (true, 3, 75),
    (true, 3, 76), (false, 3, 77), (true, 3, 78);

-- Repeat for flight_id 4 to 12
INSERT INTO Flight_seat (available, flight_id, seat_id) VALUES
    (true, 4, 1), (false, 4, 2), (true, 4, 3), (true, 4, 4), (false, 4, 5),
    (true, 4, 6), (true, 4, 7), (false, 4, 8), (true, 4, 9), (true, 4, 10),
    (false, 4, 11), (true, 4, 12), (true, 4, 13), (false, 4, 14), (true, 4, 15),
    (true, 4, 16), (false, 4, 17), (true, 4, 18), (true, 4, 19), (false, 4, 20),
    (true, 4, 21), (true, 4, 22), (false, 4, 23), (true, 4, 24), (true, 4, 25),
    (false, 4, 26), (true, 4, 27), (true, 4, 28), (false, 4, 29), (true, 4, 30),
    (true, 4, 31), (false, 4, 32), (true, 4, 33), (true, 4, 34), (false, 4, 35),
    (true, 4, 36), (true, 4, 37), (false, 4, 38), (true, 4, 39), (true, 4, 40),
    (false, 4, 41), (true, 4, 42), (true, 4, 43), (false, 4, 44), (true, 4, 45),
    (true, 4, 46), (false, 4, 47), (true, 4, 48), (true, 4, 49), (false, 4, 50),
    (true, 4, 51), (true, 4, 52), (false, 4, 53), (true, 4, 54), (true, 4, 55),
    (false, 4, 56), (true, 4, 57), (true, 4, 58), (false, 4, 59), (true, 4, 60),
    (true, 4, 61), (false, 4, 62), (true, 4, 63), (true, 4, 64), (false, 4, 65),
    (true, 4, 66), (true, 4, 67), (false, 4, 68), (true, 4, 69), (true, 4, 70),
    (false, 4, 71), (true, 4, 72), (true, 4, 73), (false, 4, 74), (true, 4, 75),
    (true, 4, 76), (false, 4, 77), (true, 4, 78);

INSERT INTO Flight_seat (available, flight_id, seat_id) VALUES
    (true, 5, 1), (false, 5, 2), (true, 5, 3), (true, 5, 4), (false, 5, 5),
    (true, 5, 6), (true, 5, 7), (false, 5, 8), (true, 5, 9), (true, 5, 10),
    (false, 5, 11), (true, 5, 12), (true, 5, 13), (false, 5, 14), (true, 5, 15),
    (true, 5, 16), (false, 5, 17), (true, 5, 18), (true, 5, 19), (false, 5, 20),
    (true, 5, 21), (true, 5, 22), (false, 5, 23), (true, 5, 24), (true, 5, 25),
    (false, 5, 26), (true, 5, 27), (true, 5, 28), (false, 5, 29), (true, 5, 30),
    (true, 5, 31), (false, 5, 32), (true, 5, 33), (true, 5, 34), (false, 5, 35),
    (true, 5, 36), (true, 5, 37), (false, 5, 38), (true, 5, 39), (true, 5, 40),
    (false, 5, 41), (true, 5, 42), (true, 5, 43), (false, 5, 44), (true, 5, 45),
    (true, 5, 46), (false, 5, 47), (true, 5, 48), (true, 5, 49), (false, 5, 50),
    (true, 5, 51), (true, 5, 52), (false, 5, 53), (true, 5, 54), (true, 5, 55),
    (false, 5, 56), (true, 5, 57), (true, 5, 58), (false, 5, 59), (true, 5, 60),
    (true, 5, 61), (false, 5, 62), (true, 5, 63), (true, 5, 64), (false, 5, 65),
    (true, 5, 66), (true, 5, 67), (false, 5, 68), (true, 5, 69), (true, 5, 70),
    (false, 5, 71), (true, 5, 72), (true, 5, 73), (false, 5, 74), (true, 5, 75),
    (true, 5, 76), (false, 5, 77), (true, 5, 78);

INSERT INTO Flight_seat (available, flight_id, seat_id) VALUES
    (true, 6, 1), (false, 6, 2), (true, 6, 3), (true, 6, 4), (false, 6, 5),
    (true, 6, 6), (true, 6, 7), (false, 6, 8), (true, 6, 9), (true, 6, 10),
    (false, 6, 11), (true, 6, 12), (true, 6, 13), (false, 6, 14), (true, 6, 15),
    (true, 6, 16), (false, 6, 17), (true, 6, 18), (true, 6, 19), (false, 6, 20),
    (true, 6, 21), (true, 6, 22), (false, 6, 23), (true, 6, 24), (true, 6, 25),
    (false, 6, 26), (true, 6, 27), (true, 6, 28), (false, 6, 29), (true, 6, 30),
    (true, 6, 31), (false, 6, 32), (true, 6, 33), (true, 6, 34), (false, 6, 35),
    (true, 6, 36), (true, 6, 37), (false, 6, 38), (true, 6, 39), (true, 6, 40),
    (false, 6, 41), (true, 6, 42), (true, 6, 43), (false, 6, 44), (true, 6, 45),
    (true, 6, 46), (false, 6, 47), (true, 6, 48), (true, 6, 49), (false, 6, 50),
    (true, 6, 51), (true, 6, 52), (false, 6, 53), (true, 6, 54), (true, 6, 55),
    (false, 6, 56), (true, 6, 57), (true, 6, 58), (false, 6, 59), (true, 6, 60),
    (true, 6, 61), (false, 6, 62), (true, 6, 63), (true, 6, 64), (false, 6, 65),
    (true, 6, 66), (true, 6, 67), (false, 6, 68), (true, 6, 69), (true, 6, 70),
    (false, 6, 71), (true, 6, 72), (true, 6, 73), (false, 6, 74), (true, 6, 75),
    (true, 6, 76), (false, 6, 77), (true, 6, 78);

INSERT INTO Flight_seat (available, flight_id, seat_id) VALUES
    (true, 7, 1), (false, 7, 2), (true, 7, 3), (true, 7, 4), (false, 7, 5),
    (true, 7, 6), (true, 7, 7), (false, 7, 8), (true, 7, 9), (true, 7, 10),
    (false, 7, 11), (true, 7, 12), (true, 7, 13), (false, 7, 14), (true, 7, 15),
    (true, 7, 16), (false, 7, 17), (true, 7, 18), (true, 7, 19), (false, 7, 20),
    (true, 7, 21), (true, 7, 22), (false, 7, 23), (true, 7, 24), (true, 7, 25),
    (false, 7, 26), (true, 7, 27), (true, 7, 28), (false, 7, 29), (true, 7, 30),
    (true, 7, 31), (false, 7, 32), (true, 7, 33), (true, 7, 34), (false, 7, 35),
    (true, 7, 36), (true, 7, 37), (false, 7, 38), (true, 7, 39), (true, 7, 40),
    (false, 7, 41), (true, 7, 42), (true, 7, 43), (false, 7, 44), (true, 7, 45),
    (true, 7, 46), (false, 7, 47), (true, 7, 48), (true, 7, 49), (false, 7, 50),
    (true, 7, 51), (true, 7, 52), (false, 7, 53), (true, 7, 54), (true, 7, 55),
    (false, 7, 56), (true, 7, 57), (true, 7, 58), (false, 7, 59), (true, 7, 60),
    (true, 7, 61), (false, 7, 62), (true, 7, 63), (true, 7, 64), (false, 7, 65),
    (true, 7, 66), (true, 7, 67), (false, 7, 68), (true, 7, 69), (true, 7, 70),
    (false, 7, 71), (true, 7, 72), (true, 7, 73), (false, 7, 74), (true, 7, 75),
    (true, 7, 76), (false, 7, 77), (true, 7, 78);

INSERT INTO Flight_seat (available, flight_id, seat_id) VALUES
    (true, 8, 1), (false, 8, 2), (true, 8, 3), (true, 8, 4), (false, 8, 5),
    (true, 8, 6), (true, 8, 7), (false, 8, 8), (true, 8, 9), (true, 8, 10),
    (false, 8, 11), (true, 8, 12), (true, 8, 13), (false, 8, 14), (true, 8, 15),
    (true, 8, 16), (false, 8, 17), (true, 8, 18), (true, 8, 19), (false, 8, 20),
    (true, 8, 21), (true, 8, 22), (false, 8, 23), (true, 8, 24), (true, 8, 25),
    (false, 8, 26), (true, 8, 27), (true, 8, 28), (false, 8, 29), (true, 8, 30),
    (true, 8, 31), (false, 8, 32), (true, 8, 33), (true, 8, 34), (false, 8, 35),
    (true, 8, 36), (true, 8, 37), (false, 8, 38), (true, 8, 39), (true, 8, 40),
    (false, 8, 41), (true, 8, 42), (true, 8, 43), (false, 8, 44), (true, 8, 45),
    (true, 8, 46), (false, 8, 47), (true, 8, 48), (true, 8, 49), (false, 8, 50),
    (true, 8, 51), (true, 8, 52), (false, 8, 53), (true, 8, 54), (true, 8, 55),
    (false, 8, 56), (true, 8, 57), (true, 8, 58), (false, 8, 59), (true, 8, 60),
    (true, 8, 61), (false, 8, 62), (true, 8, 63), (true, 8, 64), (false, 8, 65),
    (true, 8, 66), (true, 8, 67), (false, 8, 68), (true, 8, 69), (true, 8, 70),
    (false, 8, 71), (true, 8, 72), (true, 8, 73), (false, 8, 74), (true, 8, 75),
    (true, 8, 76), (false, 8, 77), (true, 8, 78);

INSERT INTO Flight_seat (available, flight_id, seat_id) VALUES
    (true, 9, 1), (false, 9, 2), (true, 9, 3), (true, 9, 4), (false, 9, 5),
    (true, 9, 6), (true, 9, 7), (false, 9, 8), (true, 9, 9), (true, 9, 10),
    (false, 9, 11), (true, 9, 12), (true, 9, 13), (false, 9, 14), (true, 9, 15),
    (true, 9, 16), (false, 9, 17), (true, 9, 18), (true, 9, 19), (false, 9, 20),
    (true, 9, 21), (true, 9, 22), (false, 9, 23), (true, 9, 24), (true, 9, 25),
    (false, 9, 26), (true, 9, 27), (true, 9, 28), (false, 9, 29), (true, 9, 30),
    (true, 9, 31), (false, 9, 32), (true, 9, 33), (true, 9, 34), (false, 9, 35),
    (true, 9, 36), (true, 9, 37), (false, 9, 38), (true, 9, 39), (true, 9, 40),
    (false, 9, 41), (true, 9, 42), (true, 9, 43), (false, 9, 44), (true, 9, 45),
    (true, 9, 46), (false, 9, 47), (true, 9, 48), (true, 9, 49), (false, 9, 50),
    (true, 9, 51), (true, 9, 52), (false, 9, 53), (true, 9, 54), (true, 9, 55),
    (false, 9, 56), (true, 9, 57), (true, 9, 58), (false, 9, 59), (true, 9, 60),
    (true, 9, 61), (false, 9, 62), (true, 9, 63), (true, 9, 64), (false, 9, 65),
    (true, 9, 66), (true, 9, 67), (false, 9, 68), (true, 9, 69), (true, 9, 70),
    (false, 9, 71), (true, 9, 72), (true, 9, 73), (false, 9, 74), (true, 9, 75),
    (true, 9, 76), (false, 9, 77), (true, 9, 78);

INSERT INTO Flight_seat (available, flight_id, seat_id) VALUES
    (true, 10, 1), (false, 10, 2), (true, 10, 3), (true, 10, 4), (false, 10, 5),
    (true, 10, 6), (true, 10, 7), (false, 10, 8), (true, 10, 9), (true, 10, 10),
    (false, 10, 11), (true, 10, 12), (true, 10, 13), (false, 10, 14), (true, 10, 15),
    (true, 10, 16), (false, 10, 17), (true, 10, 18), (true, 10, 19), (false, 10, 20),
    (true, 10, 21), (true, 10, 22), (false, 10, 23), (true, 10, 24), (true, 10, 25),
    (false, 10, 26), (true, 10, 27), (true, 10, 28), (false, 10, 29), (true, 10, 30),
    (true, 10, 31), (false, 10, 32), (true, 10, 33), (true, 10, 34), (false, 10, 35),
    (true, 10, 36), (true, 10, 37), (false, 10, 38), (true, 10, 39), (true, 10, 40),
    (false, 10, 41), (true, 10, 42), (true, 10, 43), (false, 10, 44), (true, 10, 45),
    (true, 10, 46), (false, 10, 47), (true, 10, 48), (true, 10, 49), (false, 10, 50),
    (true, 10, 51), (true, 10, 52), (false, 10, 53), (true, 10, 54), (true, 10, 55),
    (false, 10, 56), (true, 10, 57), (true, 10, 58), (false, 10, 59), (true, 10, 60),
    (true, 10, 61), (false, 10, 62), (true, 10, 63), (true, 10, 64), (false, 10, 65),
    (true, 10, 66), (true, 10, 67), (false, 10, 68), (true, 10, 69), (true, 10, 70),
    (false, 10, 71), (true, 10, 72), (true, 10, 73), (false, 10, 74), (true, 10, 75),
    (true, 10, 76), (false, 10, 77), (true, 10, 78);

INSERT INTO Flight_seat (available, flight_id, seat_id) VALUES
    (true, 11, 1), (false, 11, 2), (true, 11, 3), (true, 11, 4), (false, 11, 5),
    (true, 11, 6), (true, 11, 7), (false, 11, 8), (true, 11, 9), (true, 11, 10),
    (false, 11, 11), (true, 11, 12), (true, 11, 13), (false, 11, 14), (true, 11, 15),
    (true, 11, 16), (false, 11, 17), (true, 11, 18), (true, 11, 19), (false, 11, 20),
    (true, 11, 21), (true, 11, 22), (false, 11, 23), (true, 11, 24), (true, 11, 25),
    (false, 11, 26), (true, 11, 27), (true, 11, 28), (false, 11, 29), (true, 11, 30),
    (true, 11, 31), (false, 11, 32), (true, 11, 33), (true, 11, 34), (false, 11, 35),
    (true, 11, 36), (true, 11, 37), (false, 11, 38), (true, 11, 39), (true, 11, 40),
    (false, 11, 41), (true, 11, 42), (true, 11, 43), (false, 11, 44), (true, 11, 45),
    (true, 11, 46), (false, 11, 47), (true, 11, 48), (true, 11, 49), (false, 11, 50),
    (true, 11, 51), (true, 11, 52), (false, 11, 53), (true, 11, 54), (true, 11, 55),
    (false, 11, 56), (true, 11, 57), (true, 11, 58), (false, 11, 59), (true, 11, 60),
    (true, 11, 61), (false, 11, 62), (true, 11, 63), (true, 11, 64), (false, 11, 65),
    (true, 11, 66), (true, 11, 67), (false, 11, 68), (true, 11, 69), (true, 11, 70),
    (false, 11, 71), (true, 11, 72), (true, 11, 73), (false, 11, 74), (true, 11, 75),
    (true, 11, 76), (false, 11, 77), (true, 11, 78);

INSERT INTO Flight_seat (available, flight_id, seat_id) VALUES
    (true, 12, 1), (false, 12, 2), (true, 12, 3), (true, 12, 4), (false, 12, 5),
    (true, 12, 6), (true, 12, 7), (false, 12, 8), (true, 12, 9), (true, 12, 10),
    (false, 12, 11), (true, 12, 12), (true, 12, 13), (false, 12, 14), (true, 12, 15),
    (true, 12, 16), (false, 12, 17), (true, 12, 18), (true, 12, 19), (false, 12, 20),
    (true, 12, 21), (true, 12, 22), (false, 12, 23), (true, 12, 24), (true, 12, 25),
    (false, 12, 26), (true, 12, 27), (true, 12, 28), (false, 12, 29), (true, 12, 30),
    (true, 12, 31), (false, 12, 32), (true, 12, 33), (true, 12, 34), (false, 12, 35),
    (true, 12, 36), (true, 12, 37), (false, 12, 38), (true, 12, 39), (true, 12, 40),
    (false, 12, 41), (true, 12, 42), (true, 12, 43), (false, 12, 44), (true, 12, 45),
    (true, 12, 46), (false, 12, 47), (true, 12, 48), (true, 12, 49), (false, 12, 50),
    (true, 12, 51), (true, 12, 52), (false, 12, 53), (true, 12, 54), (true, 12, 55),
    (false, 12, 56), (true, 12, 57), (true, 12, 58), (false, 12, 59), (true, 12, 60),
    (true, 12, 61), (false, 12, 62), (true, 12, 63), (true, 12, 64), (false, 12, 65),
    (true, 12, 66), (true, 12, 67), (false, 12, 68), (true, 12, 69), (true, 12, 70),
    (false, 12, 71), (true, 12, 72), (true, 12, 73), (false, 12, 74), (true, 12, 75),
    (true, 12, 76), (false, 12, 77), (true, 12, 78);

-- Insert Reservations
INSERT INTO Reservation (passenger_name, flight_id) VALUES
    ('John Doe', 1),
    ('Jane Smith', 2);

-- Insert ReservationSeats
INSERT INTO Reservation_seat (reservation_id, flight_seat_id, flight_id) VALUES
    (1, 1, 1),
    (2, 3, 2);
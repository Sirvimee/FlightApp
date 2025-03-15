-- Loodud AI abiga

-- Insert airplanes
INSERT INTO Airplane (id, model, capacity) VALUES (1, 'Boeing 737', 180);
INSERT INTO Airplane (id, model, capacity) VALUES (2, 'Airbus A320', 150);
INSERT INTO Airplane (id, model, capacity) VALUES (3, 'Embraer 190', 100);

-- Insert flights
INSERT INTO Flight (id, date, airline, destination, departure_time, arrival_time, price, airplane_id) VALUES
    (1, '2025-03-01', 'Delta Airlines', 'New York', '10:00:00', '2025-03-01 12:00:00', 100.0, 1),
    (2, '2025-03-02', 'United Airlines', 'Los Angeles', '11:00:00', '2025-03-02 13:00:00', 150.0, 1),
    (3, '2025-04-03', 'American Airlines', 'Chicago', '12:00:00', '2025-04-03 14:00:00', 200.0, 1),
    (4, '2025-05-04', 'Southwest Airlines', 'Houston', '13:00:00', '2025-05-04 15:00:00', 250.0, 1),
    (5, '2025-05-05', 'JetBlue', 'Phoenix', '14:00:00', '2025-05-05 16:00:00', 300.0, 1),
    (6, '2025-07-06', 'Alaska Airlines', 'Philadelphia', '15:00:00', '2025-07-06 17:00:00', 350.0, 1),
    (7, '2025-08-07', 'Spirit Airlines', 'San Antonio', '16:00:00', '2025-08-07 18:00:00', 400.0, 1),
    (8, '2025-09-08', 'Frontier Airlines', 'San Diego', '17:00:00', '2025-09-08 19:00:00', 450.0, 1),
    (9, '2025-12-09', 'Hawaiian Airlines', 'Dallas', '18:00:00', '2025-12-09 20:00:00', 500.0, 1),
    (10, '2025-12-10', 'Allegiant Air', 'San Jose', '19:00:00', '2025-12-10 21:00:00', 550.0, 1);

-- Insert seats
-- First Class (4 rows, 2 seats per row)
INSERT INTO Seat (seat_number, seat_type, seat_class, extra_legroom, exit_row, is_available, airplane_id) VALUES
    ('1A', 'WINDOW', 'FIRST_CLASS', false, false, false, 1),
    ('2B', 'AISLE', 'FIRST_CLASS', false, false, true, 1),
    ('3E', 'AISLE', 'FIRST_CLASS', false, false, true, 1),
    ('4F', 'WINDOW', 'FIRST_CLASS', false, false, false, 1),
    ('5A', 'WINDOW', 'FIRST_CLASS', false, false, false, 1),
    ('6B', 'AISLE', 'FIRST_CLASS', false, false, true, 1),
    ('7E', 'AISLE', 'FIRST_CLASS', false, false, true, 1),
    ('8F', 'WINDOW', 'FIRST_CLASS', false, false, false, 1),
    ('9A', 'WINDOW', 'FIRST_CLASS', false, false, true, 1),
    ('10B', 'AISLE', 'FIRST_CLASS', false, false, true, 1),
    ('11E', 'AISLE', 'FIRST_CLASS', false, false, true, 1),
    ('12F', 'WINDOW', 'FIRST_CLASS', false, false, false, 1),
    ('13A', 'WINDOW', 'FIRST_CLASS', false, false, true, 1),
    ('14B', 'AISLE', 'FIRST_CLASS', false, false, true, 1),
    ('15E', 'AISLE', 'FIRST_CLASS', false, false, true, 1),
    ('16F', 'WINDOW', 'FIRST_CLASS', false, false, false, 1);

-- Business Class (4 rows, 2 seats per row)
INSERT INTO Seat (seat_number, seat_type, seat_class, extra_legroom, exit_row, is_available, airplane_id) VALUES
    ('17A', 'WINDOW', 'BUSINESS', false, false, true, 1),
    ('18B', 'AISLE', 'BUSINESS', false, false, true, 1),
    ('19E', 'AISLE', 'BUSINESS', false, false, true, 1),
    ('20F', 'WINDOW', 'BUSINESS', false, false, true, 1),
    ('21A', 'WINDOW', 'BUSINESS', false, false, true, 1),
    ('22B', 'AISLE', 'BUSINESS', false, false, true, 1),
    ('23E', 'AISLE', 'BUSINESS', false, false, true, 1),
    ('24F', 'WINDOW', 'BUSINESS', false, false, true, 1);

-- Economy Class (9 rows, 6 seats per row)
INSERT INTO Seat (seat_number, seat_type, seat_class, extra_legroom, exit_row, is_available, airplane_id) VALUES
    ('25A', 'WINDOW', 'ECONOMY', false, false, false, 1),
    ('25B', 'STANDARD', 'ECONOMY', false, false, true, 1),
    ('25C', 'AISLE', 'ECONOMY', false, false, false, 1),
    ('25D', 'AISLE', 'ECONOMY', false, false, true, 1),
    ('25E', 'STANDARD', 'ECONOMY', false, false, false, 1),
    ('25F', 'WINDOW', 'ECONOMY', false, false, true, 1),
    ('26A', 'WINDOW', 'ECONOMY', false, false, false, 1),
    ('26B', 'STANDARD', 'ECONOMY', false, false, true, 1),
    ('26C', 'AISLE', 'ECONOMY', false, false, false, 1),
    ('26D', 'AISLE', 'ECONOMY', false, false, true, 1),
    ('26E', 'STANDARD', 'ECONOMY', false, false, false, 1),
    ('26F', 'WINDOW', 'ECONOMY', false, false, true, 1),
    ('27A', 'WINDOW', 'ECONOMY', true, false, true, 1),
    ('27B', 'STANDARD', 'ECONOMY', true, false, true, 1),
    ('27C', 'AISLE', 'ECONOMY', true, false, false, 1),
    ('27D', 'AISLE', 'ECONOMY', true, false, true, 1),
    ('27E', 'STANDARD', 'ECONOMY', true, false, false, 1),
    ('27F', 'WINDOW', 'ECONOMY', true, false, true, 1),
    ('28A', 'WINDOW', 'ECONOMY', false, false, true, 1),
    ('28B', 'STANDARD', 'ECONOMY', false, false, true, 1),
    ('28C', 'AISLE', 'ECONOMY', false, false, false, 1),
    ('28D', 'AISLE', 'ECONOMY', false, false, true, 1),
    ('28E', 'STANDARD', 'ECONOMY', false, false, true, 1),
    ('28F', 'WINDOW', 'ECONOMY', false, false, true, 1),
    ('29A', 'WINDOW', 'ECONOMY', false, false, true, 1),
    ('29B', 'STANDARD', 'ECONOMY', false, false, true, 1),
    ('29C', 'AISLE', 'ECONOMY', false, false, false, 1),
    ('29D', 'AISLE', 'ECONOMY', false, false, true, 1),
    ('29E', 'STANDARD', 'ECONOMY', false, false, false, 1),
    ('29F', 'WINDOW', 'ECONOMY', false, false, true, 1),
    ('30A', 'WINDOW', 'ECONOMY', false, true, true, 1),
    ('30B', 'STANDARD', 'ECONOMY', false, true, true, 1),
    ('30C', 'AISLE', 'ECONOMY', false, true, false, 1),
    ('30D', 'AISLE', 'ECONOMY', false, true, true, 1),
    ('30E', 'STANDARD', 'ECONOMY', false, true, false, 1),
    ('30F', 'WINDOW', 'ECONOMY', false, true, true, 1),
    ('31A', 'WINDOW', 'ECONOMY', false, false, true, 1),
    ('31B', 'STANDARD', 'ECONOMY', false, false, true, 1),
    ('31C', 'AISLE', 'ECONOMY', false, false, false, 1),
    ('31D', 'AISLE', 'ECONOMY', false, false, true, 1),
    ('31E', 'STANDARD', 'ECONOMY', false, false, false, 1),
    ('31F', 'WINDOW', 'ECONOMY', false, false, true, 1),
    ('32A', 'WINDOW', 'ECONOMY', false, false, false, 1),
    ('32B', 'STANDARD', 'ECONOMY', false, false, true, 1),
    ('32C', 'AISLE', 'ECONOMY', false, false, true, 1),
    ('32D', 'AISLE', 'ECONOMY', false, false, true, 1),
    ('32E', 'STANDARD', 'ECONOMY', false, false, false, 1),
    ('32F', 'WINDOW', 'ECONOMY', false, false, true, 1),
    ('33A', 'WINDOW', 'ECONOMY', false, false, true, 1),
    ('33B', 'STANDARD', 'ECONOMY', false, false, true, 1),
    ('33C', 'AISLE', 'ECONOMY', false, false, false, 1),
    ('33D', 'AISLE', 'ECONOMY', false, false, true, 1),
    ('33E', 'STANDARD', 'ECONOMY', false, false, false, 1),
    ('33F', 'WINDOW', 'ECONOMY', false, false, true, 1);
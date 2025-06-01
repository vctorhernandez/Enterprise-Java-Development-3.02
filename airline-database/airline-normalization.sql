CREATE TABLE customer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    status VARCHAR(50),
    total_mileage INT
);

CREATE TABLE aircraft (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    total_seats INT NOT NULL
);

CREATE TABLE flight (
    id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(10) NOT NULL,
    aircraft_id INT,
    flight_mileage INT NOT NULL,
    FOREIGN KEY (aircraft_id) REFERENCES aircraft(id)
);

CREATE TABLE booking (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    flight_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (flight_id) REFERENCES flight(id)
);

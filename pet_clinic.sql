-- Pet Clinic Management System
-- DBMS Mini Project
-- Database: MySQL

CREATE DATABASE IF NOT EXISTS PetClinic;
USE PetClinic;

CREATE TABLE IF NOT EXISTS Owners (
    owner_id INT PRIMARY KEY AUTO_INCREMENT,
    owner_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS Pets (
    pet_id INT PRIMARY KEY AUTO_INCREMENT,
    pet_name VARCHAR(100) NOT NULL,
    species VARCHAR(50),
    breed VARCHAR(50),
    age INT,
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES Owners(owner_id)
);

CREATE TABLE IF NOT EXISTS Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    pet_id INT NOT NULL,
    appointment_date DATE,
    reason VARCHAR(200),
    status VARCHAR(50),
    FOREIGN KEY (pet_id) REFERENCES Pets(pet_id)
);

CREATE TABLE IF NOT EXISTS Treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    pet_id INT NOT NULL,
    treatment_name VARCHAR(100),
    cost DECIMAL(8,2),
    treatment_date DATE,
    FOREIGN KEY (pet_id) REFERENCES Pets(pet_id)
);

-- Sample data
INSERT INTO Owners (owner_name, phone, address)
VALUES
('Khushi Phogat', '9876543210', 'Delhi'),
('Parnika Lodha', '9876501234', 'Chandigarh'),
('Sameer Rajora', '9876512345', 'Bangalore');

INSERT INTO Pets (pet_name, species, breed, age, owner_id)
VALUES
('Bruno', 'Dog', 'Labrador', 3, 1),
('Milo', 'Cat', 'Persian', 2, 2),
('Coco', 'Dog', 'Pug', 4, 3);

INSERT INTO Appointments (pet_id, appointment_date, reason, status)
VALUES
(1, '2026-10-24', 'Regular checkup', 'Scheduled'),
(2, '2026-10-25', 'Vaccination', 'Scheduled'),
(3, '2026-10-26', 'Dental checkup', 'Scheduled');

INSERT INTO Treatments (pet_id, treatment_name, cost, treatment_date)
VALUES
(1, 'General Checkup', 500.00, '2026-10-24'),
(2, 'Vaccination', 800.00, '2026-10-25'),
(3, 'Dental Cleaning', 1200.00, '2026-10-26');

-- Display all tables
SELECT * FROM Owners;
SELECT * FROM Pets;
SELECT * FROM Appointments;
SELECT * FROM Treatments;

-- Pet names with owner details
SELECT Pets.pet_name, Pets.species, Owners.owner_name, Owners.address
FROM Pets
JOIN Owners ON Pets.owner_id = Owners.owner_id;

-- Appointment details with pet names
SELECT Appointments.appointment_id, Pets.pet_name,
       Appointments.appointment_date, Appointments.reason, Appointments.status
FROM Appointments
JOIN Pets ON Appointments.pet_id = Pets.pet_id;

-- Treatment details with pet names
SELECT Treatments.treatment_id, Pets.pet_name,
       Treatments.treatment_name, Treatments.cost, Treatments.treatment_date
FROM Treatments
JOIN Pets ON Treatments.pet_id = Pets.pet_id;

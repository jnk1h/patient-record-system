CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(100),
    DOB DATE,
    Gender CHAR(1)
);

CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Speciality VARCHAR(100)
);

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100)
);

ALTER TABLE Doctor
ADD DepartmentID INT,
ADD FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);

CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    Date DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

CREATE TABLE MedicalRecord (
    RecordID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    Diagnosis TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

CREATE TABLE Prescription (
    PrescriptionID INT PRIMARY KEY,
    RecordID INT,
    MedicationName VARCHAR(100),
    FOREIGN KEY (RecordID) REFERENCES MedicalRecord(RecordID)
);

CREATE TABLE Billing (
    BillID INT PRIMARY KEY,
    PatientID INT,
    Amount DECIMAL(10,2),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

CREATE TABLE PatientPhone (
    PatientID INT,
    PhoneNumber VARCHAR(15),
    PRIMARY KEY (PatientID, PhoneNumber),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

INSERT INTO Department (DepartmentID, Name, Location)
VALUES (1, 'Dermatology', 'Agakhan Hospital'),
       (2, 'Pediatrics', 'Neema Hospital');

INSERT INTO Doctor (DoctorID, Name, Speciality, DepartmentID)
VALUES (101, 'Dr. Karogo', 'Dermatologist', 1),
       (102, 'Dr. Mbugua', 'Pediatrician', 2);

INSERT INTO Patient (PatientID, Name, DOB, Gender)
VALUES (201, 'Jean Emily', '2005-06-25', 'F'),
       (202, 'John Sewe', '2001-03-10', 'M');

INSERT INTO Appointment (AppointmentID, PatientID, DoctorID, Date)
VALUES (301, 201, 101, '2023-03-11'),
       (302, 202, 102, '2024-07-05');

INSERT INTO MedicalRecord (RecordID, PatientID, DoctorID, Diagnosis)
VALUES (401, 201, 101, 'Acne'),
       (402, 202, 102, 'Asthma');

INSERT INTO Prescription (PrescriptionID, RecordID, MedicationName)
VALUES (501, 401, 'Minocycline'),
       (502, 402, 'Salbutamol');

INSERT INTO Billing (BillID, PatientID, Amount)
VALUES (601, 201, 5500),
       (602, 202, 4800);

INSERT INTO Patient (PatientID, Name, DOB, Gender)
VALUES (203, 'Simon Kamau', '1990-08-14', 'M');

INSERT INTO PatientPhone (PatientID, PhoneNumber)
VALUES 
    (201, '0763483219'),
    (202, '0798290851'),
    (203, '0764836352');

SELECT * FROM Patient;
SELECT * FROM Appointment WHERE PatientID = 201;

UPDATE Doctor
SET Speciality = 'Cosmetic Dermatologist'
WHERE DoctorID = 101;

DELETE FROM Prescription
WHERE PrescriptionID = 502;

SELECT a.AppointmentID, p.Name AS PatientName, d.Name AS DoctorName, a.Date
FROM Appointment a
JOIN Patient p ON a.PatientID = p.PatientID
JOIN Doctor d ON a.DoctorID = d.DoctorID;

SELECT p.Name, SUM(b.Amount) AS TotalBill
FROM Patient p
JOIN Billing b ON p.PatientID = b.PatientID
GROUP BY p.Name;

SELECT pr.MedicationName, mr.Diagnosis
FROM Prescription pr
JOIN MedicalRecord mr ON pr.RecordID = mr.RecordID;

SELECT DISTINCT pa.Name AS PatientName
FROM Patient pa
JOIN Appointment a ON pa.PatientID = a.PatientID
JOIN Doctor d ON a.DoctorID = d.DoctorID
WHERE d.Speciality = 'Dermatologist';

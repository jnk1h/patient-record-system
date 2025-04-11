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
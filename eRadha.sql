CREATE DATABASE eRadha;
GO

USE eRadha;
GO

CREATE TABLE Role (Emri VARCHAR(30) PRIMARY KEY);
GO

CREATE TABLE Punonjes (
ID INT PRIMARY KEY IDENTITY,
Emri VARCHAR(30) NOT NULL,
Mbiemri VARCHAR(30) NOT NULL,
Email VARCHAR(50) NOT NULL,
Pozicion VARCHAR(30) NOT NULL,
Username VARCHAR(30) NOT NULL,
Password VARCHAR(50) NOT NULL,
Rol VARCHAR(30) NOT NULL,
FOREIGN KEY (Rol) REFERENCES Role(Emri)
);
GO

CREATE TABLE LlojePajisje (
ID INT PRIMARY KEY IDENTITY,
Emri VARCHAR(50) NOT NULL,
Pershkrimi VARCHAR(250) NOT NULL
);
GO

CREATE TABLE Pajisje (
ID INT PRIMARY KEY IDENTITY,
Emri VARCHAR(50) NOT NULL,
Pershkrimi VARCHAR(250) NOT NULL,
LlojiID INT NOT NULL
FOREIGN KEY (LLojiID) REFERENCES LlojePajisje(ID)
);
GO

CREATE TABLE Sherbime (
ID INT PRIMARY KEY IDENTITY,
Emri VARCHAR(50) NOT NULL,
Pershkrimi VARCHAR(250) NOT NULL,
PunonjesID INT NOT NULL,
PajisjeID INT NOT NULL,
Ora TIME NOT NULL,
Kohezgjatja TIME NOT NULL,
FOREIGN KEY (PunonjesID) REFERENCES Punonjes(ID),
FOREIGN KEY (PajisjeID) REFERENCES Pajisje(ID)
);
GO

CREATE TABLE Paciente (
ID INT PRIMARY KEY IDENTITY,
Emri VARCHAR(30) NOT NULL,
Mbiemri VARCHAR(30) NOT NULL,
Email VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Rezervime (
ID INT PRIMARY KEY IDENTITY,
SherbimiID INT NOT NULL,
PacientiID INT NOT NULL,
Data DATETIME NOT NULL,
FOREIGN KEY (SherbimiID) REFERENCES Sherbime(ID),
FOREIGN KEY (PacientiID) REFERENCES Paciente(ID)
);
GO

---Role---
INSERT INTO Role (Emri) VALUES ('Menaxher');
INSERT INTO Role (Emri) VALUES ('Punonjes');
INSERT INTO Role (Emri) VALUES ('Sportel');

---Punonjes---
INSERT INTO Punonjes (Emri, Mbiemri, Email, Pozicion, Username, Password, Rol) VALUES ('Emri1', 'Mbiemri1', 'emri1.mbiemri1@email.com', 'Menaxher', 'user1', 'password1', 'Menaxher');
INSERT INTO Punonjes (Emri, Mbiemri, Email, Pozicion, Username, Password, Rol) VALUES ('Emri2', 'Mbiemri2', 'emri2.mbiemri2@email.com', 'Punonjes', 'user2', 'password2', 'Punonjes');
INSERT INTO Punonjes (Emri, Mbiemri, Email, Pozicion, Username, Password, Rol) VALUES ('Emri3', 'Mbiemri3', 'emri3.mbiemri3@email.com', 'Punonjes', 'user3', 'password3', 'Sportel');

---LlojePajisje---
INSERT INTO LlojePajisje (Emri, Pershkrimi) VALUES ('Lloji 1', 'Pershkrimi i llojit 1');
INSERT INTO LlojePajisje (Emri, Pershkrimi) VALUES ('Lloji 2', 'Pershkrimi i llojit 2');

---Pajisje---
INSERT INTO Pajisje (LlojiID, Emri, Pershkrimi) VALUES (1, 'Pajisja 1', 'Pershkrimi i pajisjes 1');
INSERT INTO Pajisje (LlojiID, Emri, Pershkrimi) VALUES (2, 'Pajisja 2', 'Pershkrimi i pajisjes 2');

---Sherbime---
INSERT INTO Sherbime (Emri, Pershkrimi, PunonjesID, PajisjeID, Ora, Kohezgjatja) VALUES ('Sherbimi 1', 'Pershkrimi i sherbimit 1', 1, 1, '10:00:00', '01:00:00');
INSERT INTO Sherbime (Emri, Pershkrimi, PunonjesID, PajisjeID, Ora, Kohezgjatja) VALUES ('Sherbimi 2', 'Pershkrimi i sherbimit 2', 2, 2, '11:00:00', '02:00:00');

---Paciente---
INSERT INTO Paciente (Emri, Mbiemri, Email) VALUES ('Pacienti 1', 'Mbiemri i pacientit 1', 'pacienti1.mbiemri1@email.com');
INSERT INTO Paciente (Emri, Mbiemri, Email) VALUES ('Pacienti 2', 'Mbiemri i pacientit 2', 'pacienti2.mbiemri2@email.com');

--Sherbime--
INSERT INTO Rezervime (SherbimiID, PacientiID, Data) VALUES (1, 1, '2020-05-01');
INSERT INTO Rezervime (SherbimiID, PacientiID, Data) VALUES (2, 2, '2020-05-02');
INSERT INTO Rezervime (SherbimiID, PacientiID, Data) VALUES (1, 2, '2020-05-03');
INSERT INTO Rezervime (SherbimiID, PacientiID, Data) VALUES (2, 1, '2020-05-04');
INSERT INTO Rezervime (SherbimiID, PacientiID, Data) VALUES (1, 2, '2020-05-05');
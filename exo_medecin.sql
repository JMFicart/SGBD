CREATE TABLE M�decin(
   Id_M�decin INT IDENTITY,
   Nom NVARCHAR(100) NOT NULL,
   Prenom NVARCHAR(100) NOT NULL,
   Inami VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_M�decin)
);

CREATE TABLE Patient(
   Id_Patient INT IDENTITY,
   Nom NVARCHAR(100) NOT NULL,
   Prenom NVARCHAR(100) NOT NULL,
   DateNaissance DATE NOT NULL,
   Genre VARCHAR(1) NOT NULL,
   NNIS VARCHAR(20) NOT NULL,
   PRIMARY KEY(Id_Patient)
);

CREATE TABLE Sympt�me(
   Id_Symptome INT IDENTITY,
   Description VARCHAR(250) NOT NULL,
   PRIMARY KEY(Id_Symptome)
);

CREATE TABLE Pathologie(
   Id_Pathologie INT IDENTITY,
   Description VARCHAR(250) NOT NULL,
   PRIMARY KEY(Id_Pathologie)
);

CREATE TABLE Carnet_consultation(
   Id_Carnet_consultation INT IDENTITY,
   Debut DATETIME2 NOT NULL,
   Fin DATETIME2 NOT NULL,
   Prix MONEY NOT NULL,
   Remarque VARCHAR(500) NOT NULL,
   Id_Patient INT NOT NULL,
   Id_M�decin INT NOT NULL,
   PRIMARY KEY(Id_Carnet_consultation),
   FOREIGN KEY(Id_Patient) REFERENCES Patient(Id_Patient),
   FOREIGN KEY(Id_M�decin) REFERENCES M�decin(Id_M�decin)
);

CREATE TABLE Pr�senter(
   Id_Carnet_consultation INT,
   Id_Symptome INT,
   ValeurParam�tre VARCHAR(250) NOT NULL,
   PRIMARY KEY(Id_Carnet_consultation, Id_Symptome),
   FOREIGN KEY(Id_Carnet_consultation) REFERENCES Carnet_consultation(Id_Carnet_consultation),
   FOREIGN KEY(Id_Symptome) REFERENCES Sympt�me(Id_Symptome)
);

CREATE TABLE Diagnostiquer(
   Id_Carnet_consultation INT,
   Id_Pathologie INT,
   PRIMARY KEY(Id_Carnet_consultation, Id_Pathologie),
   FOREIGN KEY(Id_Carnet_consultation) REFERENCES Carnet_consultation(Id_Carnet_consultation),
   FOREIGN KEY(Id_Pathologie) REFERENCES Pathologie(Id_Pathologie)
);

CREATE TABLE Associer(
   Id_Symptome INT,
   Id_Pathologie INT,
   PRIMARY KEY(Id_Symptome, Id_Pathologie),
   FOREIGN KEY(Id_Symptome) REFERENCES Sympt�me(Id_Symptome),
   FOREIGN KEY(Id_Pathologie) REFERENCES Pathologie(Id_Pathologie)
);

CREATE TABLE Taille(
   Id_Taille INT IDENTITY,
   Description VARCHAR(50),
   PRIMARY KEY(Id_Taille)
);

CREATE TABLE Localisation(
   Id_Localisation INT IDENTITY,
   Description VARCHAR(50),
   PRIMARY KEY(Id_Localisation)
);

CREATE TABLE Titre(
   Id_Titre INT IDENTITY,
   Description VARCHAR(50),
   PRIMARY KEY(Id_Titre)
);

CREATE TABLE Statut(
   Id_Statut INT IDENTITY,
   Description VARCHAR(50),
   PRIMARY KEY(Id_Statut)
);

CREATE TABLE Ville(
   Id_Ville INT IDENTITY,
   Codepostal VARCHAR(50),
   Localite VARCHAR(50),
   PRIMARY KEY(Id_Ville)
);

CREATE TABLE CanalCommunication(
   Id_CanalCommunication INT IDENTITY,
   Description VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_CanalCommunication)
);

CREATE TABLE Session(
   Id_Session INT IDENTITY,
   DateDebut DATE NOT NULL,
   DateFin DATE NOT NULL,
   PRIMARY KEY(Id_Session)
);

CREATE TABLE Coaching(
   Id_Coaching INT IDENTITY,
   Description VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_Coaching)
);

CREATE TABLE Cours(
   Id_Cours INT IDENTITY,
   Intitulé NVARCHAR(200) NOT NULL,
   Duree INT NOT NULL,
   PRIMARY KEY(Id_Cours)
);

CREATE TABLE Société(
   Id_Société INT IDENTITY,
   Adresse NVARCHAR(50),
   Remarque NVARCHAR(500),
   FK_Id_Taille INT NOT NULL,
   FK_Id_Ville INT,
   PRIMARY KEY(Id_Société),
   FOREIGN KEY(FK_Id_Taille) REFERENCES Taille(Id_Taille),
   FOREIGN KEY(FK_Id_Ville) REFERENCES Ville(Id_Ville)
);

CREATE TABLE Inscrit(
   Id_Inscrit INT IDENTITY,
   Nom NVARCHAR(250) NOT NULL,
   Prenom NVARCHAR(50),
   Remarque NVARCHAR(50),
   FK_Id_Société INT,
   FK_Id_Statut INT NOT NULL,
   FK_Id_Localisation INT NOT NULL,
   FK_Id_Titre INT NOT NULL,
   PRIMARY KEY(Id_Inscrit),
   FOREIGN KEY(FK_Id_Société) REFERENCES Société(Id_Société),
   FOREIGN KEY(FK_Id_Statut) REFERENCES Statut(Id_Statut),
   FOREIGN KEY(FK_Id_Localisation) REFERENCES Localisation(Id_Localisation),
   FOREIGN KEY(FK_Id_Titre) REFERENCES Titre(Id_Titre)
);

CREATE TABLE Communication(
   Id_Communication INT IDENTITY,
   Valeur VARCHAR(50) NOT NULL,
   FK_Id_CanalCommunication INT NOT NULL,
   FK_Id_Inscrit INT NOT NULL,
   PRIMARY KEY(Id_Communication),
   FOREIGN KEY(FK_Id_CanalCommunication) REFERENCES CanalCommunication(Id_CanalCommunication),
   FOREIGN KEY(FK_Id_Inscrit) REFERENCES Inscrit(Id_Inscrit)
);

CREATE TABLE Inscription(
   Id_Inscription INT IDENTITY,
   Frais MONEY,
   DateFacture DATE,
   Remarque VARCHAR(500),
   FK_Id_Session INT NOT NULL,
   FK_Id_Inscrit INT NOT NULL,
   PRIMARY KEY(Id_Inscription),
   FOREIGN KEY(FK_Id_Session) REFERENCES Session(Id_Session),
   FOREIGN KEY(FK_Id_Inscrit) REFERENCES Inscrit(Id_Inscrit)
);

CREATE TABLE Asso_13(
   FK_Id_Session INT,
   FK_Id_Coaching INT,
   FK_Id_Cours INT,
   PRIMARY KEY(FK_Id_Session, FK_Id_Coaching, FK_Id_Cours),
   FOREIGN KEY(FK_Id_Session) REFERENCES Session(Id_Session),
   FOREIGN KEY(FK_Id_Coaching) REFERENCES Coaching(Id_Coaching),
   FOREIGN KEY(FK_Id_Cours) REFERENCES Cours(Id_Cours)
);

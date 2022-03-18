CREATE TABLE RegimeAlimentaire(
   Id_RegimeAlimentaire INT IDENTITY,
   NomRegime VARCHAR(250) NOT NULL,
   Remarque VARCHAR(500),
   PRIMARY KEY(Id_RegimeAlimentaire)
);

CREATE TABLE Ingredient(
   Id_Ingredient INT IDENTITY,
   NomIngredient VARCHAR(250) NOT NULL,
   CoutUnitaire DECIMAL(8,2) NOT NULL,
   PRIMARY KEY(Id_Ingredient)
);

CREATE TABLE Nutriment(
   Id_Nutriment INT IDENTITY,
   NomNutriment NVARCHAR(200) NOT NULL,
   PRIMARY KEY(Id_Nutriment)
);

CREATE TABLE EspeceAnimal(
   Id_EspeceAnimal INT IDENTITY,
   NomEspece NVARCHAR(200) NOT NULL,
   PRIMARY KEY(Id_EspeceAnimal)
);

CREATE TABLE SoinParticulier(
   Id_SoinParticulier INT IDENTITY,
   NomSoin NVARCHAR(100) NOT NULL,
   CoutParJour DECIMAL(8,2) NOT NULL,
   PRIMARY KEY(Id_SoinParticulier)
);

CREATE TABLE Animal(
   Id_Animal INT IDENTITY,
   NomAnimal NVARCHAR(100) NOT NULL,
   DateNaissanceAnimal DATE NOT NULL,
   PoidsAnimal DECIMAL(8,2) NOT NULL,
   Id_EspeceAnimal INT NOT NULL,
   PRIMARY KEY(Id_Animal),
   FOREIGN KEY(Id_EspeceAnimal) REFERENCES EspeceAnimal(Id_EspeceAnimal)
);

CREATE TABLE BesoinEspece(
   Id_BesoinEspece INT IDENTITY,
   BesoinMinimum DECIMAL(4,3) NOT NULL,
   BesoinMaximum DECIMAL(8,3) NOT NULL,
   Id_EspeceAnimal INT NOT NULL,
   Id_Nutriment INT NOT NULL,
   PRIMARY KEY(Id_BesoinEspece),
   FOREIGN KEY(Id_EspeceAnimal) REFERENCES EspeceAnimal(Id_EspeceAnimal),
   FOREIGN KEY(Id_Nutriment) REFERENCES Nutriment(Id_Nutriment)
);

CREATE TABLE Contenir(
   Id_RegimeAlimentaire INT,
   Id_Ingredient INT,
   Quantite DECIMAL(8,3) NOT NULL,
   PRIMARY KEY(Id_RegimeAlimentaire, Id_Ingredient),
   FOREIGN KEY(Id_RegimeAlimentaire) REFERENCES RegimeAlimentaire(Id_RegimeAlimentaire),
   FOREIGN KEY(Id_Ingredient) REFERENCES Ingredient(Id_Ingredient)
);

CREATE TABLE Contenir1(
   Id_Ingredient INT,
   Id_Nutriment INT,
   Quantite DECIMAL(8,2) NOT NULL,
   PRIMARY KEY(Id_Ingredient, Id_Nutriment),
   FOREIGN KEY(Id_Ingredient) REFERENCES Ingredient(Id_Ingredient),
   FOREIGN KEY(Id_Nutriment) REFERENCES Nutriment(Id_Nutriment)
);

CREATE TABLE Requerir(
   Id_Animal INT,
   Id_SoinParticulier INT,
   DateDebutSoin DATE NOT NULL,
   DateFinSoin DATE,
   PRIMARY KEY(Id_Animal, Id_SoinParticulier),
   FOREIGN KEY(Id_Animal) REFERENCES Animal(Id_Animal),
   FOREIGN KEY(Id_SoinParticulier) REFERENCES SoinParticulier(Id_SoinParticulier)
);

CREATE TABLE Consommer(
   Id_RegimeAlimentaire INT,
   Id_Animal INT,
   DateDebutRegime DATE NOT NULL,
   DateFinRegime DATE,
   PRIMARY KEY(Id_RegimeAlimentaire, Id_Animal),
   FOREIGN KEY(Id_RegimeAlimentaire) REFERENCES RegimeAlimentaire(Id_RegimeAlimentaire),
   FOREIGN KEY(Id_Animal) REFERENCES Animal(Id_Animal)
);

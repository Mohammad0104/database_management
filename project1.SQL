/*
Created: 10/17/2022
Modified: 10/17/2022
Model: PostgreSQL 10
Database: PostgreSQL 10
*/

-- Create tables section -------------------------------------------------

-- Table Movies

CREATE TABLE "Movies"
(
  "Movie_id" Bigint NOT NULL,
  "Title" Character varying NOT NULL,
  "Release Date" Date NOT NULL,
  "Rating" Bigint NOT NULL,
  "Budget" Bigint NOT NULL,
  "Actors_id" Integer NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_has a" ON "Movies" ("Actors_id")
;

ALTER TABLE "Movies" ADD CONSTRAINT "PK_Movies" PRIMARY KEY ("Movie_id")
;

-- Table Movies Director

CREATE TABLE "Movies Director"
(
  "First Name,Surname" Character varying NOT NULL,
  "Director_id" Bigint NOT NULL,
  "Year of Birth" Date NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Movies Director" ADD CONSTRAINT "PK_Movies Director" PRIMARY KEY ("First Name,Surname","Director_id")
;

-- Table Movies Actor

CREATE TABLE "Movies Actor"
(
  "Actors_id" Integer NOT NULL,
  "First Name,Surname" Character varying NOT NULL,
  "Date of Birth" Date NOT NULL,
  "Eye Colour" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Movies Actor" ADD CONSTRAINT "PK_Movies Actor" PRIMARY KEY ("Actors_id")
;

-- Table Actor & director Birth Location

CREATE TABLE "Actor & director Birth Location"
(
  "City" Character varying NOT NULL,
  "State" Character varying NOT NULL,
  "Country" Character varying NOT NULL,
  "Actors_id" Integer NOT NULL,
  "First Name,Surname" Character varying NOT NULL,
  "Director_id" Bigint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Actor & director Birth Location" ADD CONSTRAINT "PK_Actor & director Birth Location" PRIMARY KEY ("City","State","Country","Actors_id","First Name,Surname","Director_id")
;

-- Table Type of cinema_hall

CREATE TABLE "Type of cinema_hall"
(
  "Category" Bigint NOT NULL,
  "Cinema_id" Bigint NOT NULL,
  "date" Date NOT NULL,
  "time" Time NOT NULL,
  "duration" Integer NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Type of cinema_hall" ADD CONSTRAINT "PK_Type of cinema_hall" PRIMARY KEY ("Category","Cinema_id")
;

ALTER TABLE "Type of cinema_hall" ADD CONSTRAINT "time" UNIQUE ("time")
;

ALTER TABLE "Type of cinema_hall" ADD CONSTRAINT "duration" UNIQUE ("duration")
;

ALTER TABLE "Type of cinema_hall" ADD CONSTRAINT "date" UNIQUE ("date")
;

-- Table tickets

CREATE TABLE "tickets"
(
  "Name of cinema" Character varying NOT NULL,
  "Movie_id" Bigint NOT NULL,
  "Price" Money NOT NULL,
  "location" Character varying NOT NULL,
  "Type of cinema_hall" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "tickets" ADD CONSTRAINT "PK_tickets" PRIMARY KEY ("Name of cinema","Movie_id")
;

-- Table Awards

CREATE TABLE "Awards"
(
  "Award_show" Character varying NOT NULL,
  "First Name,Surname" Character varying NOT NULL,
  "Actors_id" Integer NOT NULL,
  "Director_id" Bigint NOT NULL,
  "Category_award" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Awards" ADD CONSTRAINT "PK_Awards" PRIMARY KEY ("Award_show","Actors_id","First Name,Surname","Director_id")
;

ALTER TABLE "Awards" ADD CONSTRAINT "Category_award" UNIQUE ("Category_award")
;

-- Table Festivals

CREATE TABLE "Festivals"
(
  "Name of festival" Character varying NOT NULL,
  "Location" Character varying NOT NULL,
  "Award_show" Character varying NOT NULL,
  "Actors_id" Integer NOT NULL,
  "First Name,Surname" Character varying NOT NULL,
  "Director_id" Bigint NOT NULL,
  "Date" Date NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Festivals" ADD CONSTRAINT "PK_Festivals" PRIMARY KEY ("Name of festival","Location","Award_show","Actors_id","First Name,Surname","Director_id")
;

ALTER TABLE "Festivals" ADD CONSTRAINT "Date" UNIQUE ("Date")
;

-- Table Cinema

CREATE TABLE "Cinema"
(
  "Cinema_id" Bigint NOT NULL,
  "Name of cinema" Character varying NOT NULL,
  "Movie_id" Bigint NOT NULL,
  "name_of_cinema" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_has" ON "Cinema" ("Name of cinema","Movie_id")
;

ALTER TABLE "Cinema" ADD CONSTRAINT "PK_Cinema" PRIMARY KEY ("Cinema_id")
;

-- Table Genre

CREATE TABLE "Genre"
(
  "category" Bigint NOT NULL,
  "Movie_id" Bigint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship35" ON "Genre" ("Movie_id")
;

ALTER TABLE "Genre" ADD CONSTRAINT "PK_Genre" PRIMARY KEY ("category")
;

-- Table Department

CREATE TABLE "Department"
(
  "Actors_id" Integer NOT NULL,
  "First Name,Surname" Character varying NOT NULL,
  "Director_id" Bigint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Department" ADD CONSTRAINT "PK_Department" PRIMARY KEY ("Actors_id","First Name,Surname","Director_id")
;

-- Table University

CREATE TABLE "University"
(
  "University_id" Bigint NOT NULL,
  "Student_id" Bigint NOT NULL,
  "First Name,Surname" Character varying NOT NULL,
  "Director_id" Bigint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "University" ADD CONSTRAINT "PK_University" PRIMARY KEY ("University_id","Student_id","First Name,Surname","Director_id")
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE "Genre"
  ADD CONSTRAINT "category"
    FOREIGN KEY ("Movie_id")
    REFERENCES "Movies" ("Movie_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "University"
  ADD CONSTRAINT "has m"
    FOREIGN KEY ("First Name,Surname", "Director_id")
    REFERENCES "Movies Director" ("First Name,Surname", "Director_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Cinema"
  ADD CONSTRAINT "related"
    FOREIGN KEY ("Name of cinema", "Movie_id")
    REFERENCES "tickets" ("Name of cinema", "Movie_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Type of cinema_hall"
  ADD CONSTRAINT "added"
    FOREIGN KEY ("Cinema_id")
    REFERENCES "Cinema" ("Cinema_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Festivals"
  ADD CONSTRAINT "belongs to"
    FOREIGN KEY ("Award_show", "Actors_id", "First Name,Surname", "Director_id")
    REFERENCES "Awards" ("Award_show", "Actors_id", "First Name,Surname", "Director_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Department"
  ADD CONSTRAINT "director department"
    FOREIGN KEY ("First Name,Surname", "Director_id")
    REFERENCES "Movies Director" ("First Name,Surname", "Director_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actor & director Birth Location"
  ADD CONSTRAINT "director_birth"
    FOREIGN KEY ("First Name,Surname", "Director_id")
    REFERENCES "Movies Director" ("First Name,Surname", "Director_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Movies"
  ADD CONSTRAINT "has a"
    FOREIGN KEY ("Actors_id")
    REFERENCES "Movies Actor" ("Actors_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "tickets"
  ADD CONSTRAINT "movies has a reletion with tickets"
    FOREIGN KEY ("Movie_id")
    REFERENCES "Movies" ("Movie_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Awards"
  ADD CONSTRAINT "actor recieved"
    FOREIGN KEY ("Actors_id")
    REFERENCES "Movies Actor" ("Actors_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Department"
  ADD CONSTRAINT "actor department"
    FOREIGN KEY ("Actors_id")
    REFERENCES "Movies Actor" ("Actors_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actor & director Birth Location"
  ADD CONSTRAINT "actor birth"
    FOREIGN KEY ("Actors_id")
    REFERENCES "Movies Actor" ("Actors_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Awards"
  ADD CONSTRAINT "director_recived"
    FOREIGN KEY ("First Name,Surname", "Director_id")
    REFERENCES "Movies Director" ("First Name,Surname", "Director_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;


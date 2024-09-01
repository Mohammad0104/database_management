/*
Created: 10/28/2022
Modified: 11/3/2022
Model: PostgreSQL 10
Database: PostgreSQL 10
*/

-- Create tables section -------------------------------------------------

-- Table Movie

CREATE TABLE "Movie"
(
  "MovieName" Character varying(50) NOT NULL,
  "ReleaseDate" Date NOT NULL,
  "Rating" Double precision NOT NULL,
  "Budget" Bigint NOT NULL,
  "Gross" Bigint
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Movie" ADD CONSTRAINT "PK_Movie" PRIMARY KEY ("ReleaseDate","MovieName")
;

-- Table Genre

CREATE TABLE "Genre"
(
  "Type" Character varying(50) NOT NULL,
  "Description" Character varying(100) NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Genre" ADD CONSTRAINT "PK_Genre" PRIMARY KEY ("Type")
;

-- Table MovieGenre

CREATE TABLE "MovieGenre"
(
  "ReleaseDate" Date NOT NULL,
  "MovieName" Character varying(50) NOT NULL,
  "Type" Character varying(50) NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "MovieGenre" ADD CONSTRAINT "PK_MovieGenre" PRIMARY KEY ("ReleaseDate","MovieName","Type")
;

-- Table Category

CREATE TABLE "Category"
(
  "CategoryName" Character varying(50) NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Category" ADD CONSTRAINT "PK_Category" PRIMARY KEY ("CategoryName")
;

-- Table Award

CREATE TABLE "Award"
(
  "AwardName" Character varying(50) NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Award" ADD CONSTRAINT "PK_Award" PRIMARY KEY ("AwardName")
;

-- Table AwardGiven

CREATE TABLE "AwardGiven"
(
  "ReleaseDate" Date NOT NULL,
  "MovieName" Character varying(50) NOT NULL,
  "CategoryName" Character varying(50) NOT NULL,
  "AwardName" Character varying(50) NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "AwardGiven" ADD CONSTRAINT "PK_AwardGiven" PRIMARY KEY ("ReleaseDate","MovieName","CategoryName","AwardName")
;

-- Table MovieTicket

CREATE TABLE "MovieTicket"
(
  "TicketID" Bigint NOT NULL,
  "Price" Bigint NOT NULL,
  "TicketDate" Date NOT NULL,
  "ShowingTime" Time NOT NULL,
  "DurationInMinutes" Bigint NOT NULL,
  "CinemaHall" Character varying(50) NOT NULL,
  "ReleaseDate" Date NOT NULL,
  "MovieName" Character varying(50) NOT NULL,
  "CinemaID" Bigint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "MovieTicket" ADD CONSTRAINT "PK_MovieTicket" PRIMARY KEY ("TicketID","ReleaseDate","MovieName","CinemaID")
;

-- Table Cinema

CREATE TABLE "Cinema"
(
  "CinemaID" Bigint NOT NULL,
  "CinemaName" Character varying(50) NOT NULL,
  "City" Character varying(50),
  "State/Province" Character varying(50),
  "Country" Character varying(50)
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship11" ON "Cinema" ("City","State/Province","Country")
;

ALTER TABLE "Cinema" ADD CONSTRAINT "PK_Cinema" PRIMARY KEY ("CinemaID")
;

-- Table Festival

CREATE TABLE "Festival"
(
  "MovieFestivalName" Character varying(50) NOT NULL,
  "StartDay" Date NOT NULL,
  "EndDay" Date NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Festival" ADD CONSTRAINT "PK_Festival" PRIMARY KEY ("MovieFestivalName")
;

-- Table FestivalMovie

CREATE TABLE "FestivalMovie"
(
  "ReleaseDate" Date NOT NULL,
  "MovieName" Character varying(50) NOT NULL,
  "MovieFestivalName" Character varying(50) NOT NULL,
  "ShowTime" Time NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "FestivalMovie" ADD CONSTRAINT "PK_FestivalMovie" PRIMARY KEY ("ReleaseDate","MovieName","MovieFestivalName")
;

-- Table Actor

CREATE TABLE "Actor"
(
  "ActorID" Bigint NOT NULL,
  "FirstName" Character varying(50) NOT NULL,
  "LastName" Character varying(50) NOT NULL,
  "DateOfBirth" Date NOT NULL,
  "EyeColor" Character varying(50),
  "UniversityName" Character varying(100),
  "DepartmentName" Character varying(50),
  "City" Character varying(50),
  "State/Province" Character varying(50),
  "Country" Character varying(50)
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship13" ON "Actor" ("UniversityName","DepartmentName")
;

CREATE INDEX "IX_Relationship17" ON "Actor" ("City","State/Province","Country")
;

ALTER TABLE "Actor" ADD CONSTRAINT "PK_Actor" PRIMARY KEY ("ActorID")
;

-- Table Location

CREATE TABLE "Location"
(
  "City" Character varying(50) NOT NULL,
  "State/Province" Character varying(50) NOT NULL,
  "Country" Character varying(50) NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Location" ADD CONSTRAINT "PK_Location" PRIMARY KEY ("City","State/Province","Country")
;

-- Table University

CREATE TABLE "University"
(
  "UniversityName" Character varying(100) NOT NULL,
  "NumberOfStudents" Bigint NOT NULL,
  "PrivateOrPublic" Boolean NOT NULL,
  "Colour" Character varying(50) NOT NULL,
  "Description" Character varying(100),
  "DepartmentName" Character varying(50) NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "University" ADD CONSTRAINT "PK_University" PRIMARY KEY ("UniversityName","DepartmentName")
;

-- Table Department

CREATE TABLE "Department"
(
  "DepartmentName" Character varying(50) NOT NULL,
  "NumberOfStudents" Bigint NOT NULL,
  "Description" Character varying(100)
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Department" ADD CONSTRAINT "PK_Department" PRIMARY KEY ("DepartmentName")
;

-- Table MovieCast

CREATE TABLE "MovieCast"
(
  "ReleaseDate" Date NOT NULL,
  "MovieName" Character varying(50) NOT NULL,
  "ActorID" Bigint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "MovieCast" ADD CONSTRAINT "PK_MovieCast" PRIMARY KEY ("ReleaseDate","MovieName","ActorID")
;

-- Table Director

CREATE TABLE "Director"
(
  "DirectorID" Bigint NOT NULL,
  "FirstName" Character varying(50) NOT NULL,
  "LastName" Character varying(50) NOT NULL,
  "YearOfBirth" Date NOT NULL,
  "City" Character varying(50),
  "State/Province" Character varying(50),
  "Country" Character varying(50),
  "UniversityName" Character varying(100),
  "DepartmentName" Character varying(50)
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship16" ON "Director" ("City","State/Province","Country")
;

CREATE INDEX "IX_Relationship18" ON "Director" ("UniversityName","DepartmentName")
;

ALTER TABLE "Director" ADD CONSTRAINT "PK_Director" PRIMARY KEY ("DirectorID")
;

-- Table DirectorCast

CREATE TABLE "DirectorCast"
(
  "ReleaseDate" Date NOT NULL,
  "MovieName" Character varying(50) NOT NULL,
  "DirectorID" Bigint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "DirectorCast" ADD CONSTRAINT "PK_DirectorCast" PRIMARY KEY ("ReleaseDate","MovieName","DirectorID")
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE "MovieGenre"
  ADD CONSTRAINT "Relationship1"
    FOREIGN KEY ("ReleaseDate", "MovieName")
    REFERENCES "Movie" ("ReleaseDate", "MovieName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "MovieGenre"
  ADD CONSTRAINT "Relationship2"
    FOREIGN KEY ("Type")
    REFERENCES "Genre" ("Type")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "AwardGiven"
  ADD CONSTRAINT "Relationship3"
    FOREIGN KEY ("ReleaseDate", "MovieName")
    REFERENCES "Movie" ("ReleaseDate", "MovieName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "AwardGiven"
  ADD CONSTRAINT "Relationship4"
    FOREIGN KEY ("CategoryName")
    REFERENCES "Category" ("CategoryName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "AwardGiven"
  ADD CONSTRAINT "Relationship6"
    FOREIGN KEY ("AwardName")
    REFERENCES "Award" ("AwardName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "FestivalMovie"
  ADD CONSTRAINT "Relationship7"
    FOREIGN KEY ("ReleaseDate", "MovieName")
    REFERENCES "Movie" ("ReleaseDate", "MovieName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "FestivalMovie"
  ADD CONSTRAINT "Relationship8"
    FOREIGN KEY ("MovieFestivalName")
    REFERENCES "Festival" ("MovieFestivalName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "MovieTicket"
  ADD CONSTRAINT "Relationship9"
    FOREIGN KEY ("ReleaseDate", "MovieName")
    REFERENCES "Movie" ("ReleaseDate", "MovieName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "MovieTicket"
  ADD CONSTRAINT "Relationship10"
    FOREIGN KEY ("CinemaID")
    REFERENCES "Cinema" ("CinemaID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Cinema"
  ADD CONSTRAINT "Relationship11"
    FOREIGN KEY ("City", "State/Province", "Country")
    REFERENCES "Location" ("City", "State/Province", "Country")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "University"
  ADD CONSTRAINT "Relationship12"
    FOREIGN KEY ("DepartmentName")
    REFERENCES "Department" ("DepartmentName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actor"
  ADD CONSTRAINT "Relationship13"
    FOREIGN KEY ("UniversityName", "DepartmentName")
    REFERENCES "University" ("UniversityName", "DepartmentName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "MovieCast"
  ADD CONSTRAINT "Relationship14"
    FOREIGN KEY ("ReleaseDate", "MovieName")
    REFERENCES "Movie" ("ReleaseDate", "MovieName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "MovieCast"
  ADD CONSTRAINT "Relationship15"
    FOREIGN KEY ("ActorID")
    REFERENCES "Actor" ("ActorID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Director"
  ADD CONSTRAINT "Relationship16"
    FOREIGN KEY ("City", "State/Province", "Country")
    REFERENCES "Location" ("City", "State/Province", "Country")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actor"
  ADD CONSTRAINT "Relationship17"
    FOREIGN KEY ("City", "State/Province", "Country")
    REFERENCES "Location" ("City", "State/Province", "Country")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Director"
  ADD CONSTRAINT "Relationship18"
    FOREIGN KEY ("UniversityName", "DepartmentName")
    REFERENCES "University" ("UniversityName", "DepartmentName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "DirectorCast"
  ADD CONSTRAINT "Relationship19"
    FOREIGN KEY ("ReleaseDate", "MovieName")
    REFERENCES "Movie" ("ReleaseDate", "MovieName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "DirectorCast"
  ADD CONSTRAINT "Relationship20"
    FOREIGN KEY ("DirectorID")
    REFERENCES "Director" ("DirectorID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;


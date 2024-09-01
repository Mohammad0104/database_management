/*
Created: 10/28/2022
Modified: 11/4/2022
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
  "Budget" Bigint NOT NULL
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

-- Table Award win

CREATE TABLE "Award win"
(
  "ReleaseDate" Date NOT NULL,
  "MovieName" Character varying(50) NOT NULL,
  "CategoryName" Character varying(50) NOT NULL,
  "AwardName" Character varying(50) NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Award win" ADD CONSTRAINT "PK_Award win" PRIMARY KEY ("ReleaseDate","MovieName","CategoryName","AwardName")
;

-- Table MovieTicket

CREATE TABLE "MovieTicket"
(
  "TicketID" Bigint NOT NULL,
  "ReleaseDate" Date NOT NULL,
  "MovieName" Character varying(50) NOT NULL,
  "CinemaID" Bigint NOT NULL,
  "Price" Bigint NOT NULL,
  "CinemaHall" Character varying(50) NOT NULL,
  "DurationInMinutes" Bigint NOT NULL,
  "ShowingTime" Time NOT NULL,
  "TicketDate" Date NOT NULL
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
  "City" Character varying(50),
  "State/Province" Character varying(50),
  "Country" Character varying(50),
  "CinemaName" Character varying(50) NOT NULL
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

-- Table MovieFestival

CREATE TABLE "MovieFestival"
(
  "ReleaseDate" Date NOT NULL,
  "MovieName" Character varying(50) NOT NULL,
  "MovieFestivalName" Character varying(50) NOT NULL,
  "ShowTime" Time NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "MovieFestival" ADD CONSTRAINT "PK_MovieFestival" PRIMARY KEY ("ReleaseDate","MovieName","MovieFestivalName")
;

-- Table Actor

CREATE TABLE "Actor"
(
  "ActorID" Bigint NOT NULL,
  "UniversityName" Character varying(100),
  "DepartmentName" Character varying(50),
  "City" Character varying(50),
  "State/Province" Character varying(50),
  "Country" Character varying(50),
  "DateOfBirth" Date NOT NULL,
  "LastName" Character varying(50) NOT NULL,
  "FirstName" Character varying(50) NOT NULL
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
  "DepartmentName" Character varying(50) NOT NULL,
  "Colour" Character varying(50) NOT NULL,
  "PrivateOrPublic" Boolean NOT NULL,
  "NumberOfStudents" Bigint NOT NULL
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
  "NumberOfStudents" Bigint NOT NULL
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
  "City" Character varying(50),
  "State/Province" Character varying(50),
  "Country" Character varying(50),
  "UniversityName" Character varying(100),
  "DepartmentName" Character varying(50),
  "FirstName" Character varying(50) NOT NULL,
  "LastName" Character varying(50) NOT NULL,
  "YearOfBirth" Date NOT NULL
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

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE "MovieGenre"
  ADD CONSTRAINT "has a"
    FOREIGN KEY ("ReleaseDate", "MovieName")
    REFERENCES "Movie" ("ReleaseDate", "MovieName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "MovieGenre"
  ADD CONSTRAINT "has a2"
    FOREIGN KEY ("Type")
    REFERENCES "Genre" ("Type")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Award win"
  ADD CONSTRAINT "has a3"
    FOREIGN KEY ("ReleaseDate", "MovieName")
    REFERENCES "Movie" ("ReleaseDate", "MovieName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Award win"
  ADD CONSTRAINT "has a6"
    FOREIGN KEY ("CategoryName")
    REFERENCES "Category" ("CategoryName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Award win"
  ADD CONSTRAINT "has a7"
    FOREIGN KEY ("AwardName")
    REFERENCES "Award" ("AwardName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "MovieFestival"
  ADD CONSTRAINT "has a4"
    FOREIGN KEY ("ReleaseDate", "MovieName")
    REFERENCES "Movie" ("ReleaseDate", "MovieName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "MovieFestival"
  ADD CONSTRAINT "has a5"
    FOREIGN KEY ("MovieFestivalName")
    REFERENCES "Festival" ("MovieFestivalName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "MovieTicket"
  ADD CONSTRAINT "has a8"
    FOREIGN KEY ("ReleaseDate", "MovieName")
    REFERENCES "Movie" ("ReleaseDate", "MovieName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "MovieTicket"
  ADD CONSTRAINT "has a9"
    FOREIGN KEY ("CinemaID")
    REFERENCES "Cinema" ("CinemaID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Cinema"
  ADD CONSTRAINT "has a11"
    FOREIGN KEY ("City", "State/Province", "Country")
    REFERENCES "Location" ("City", "State/Province", "Country")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "University"
  ADD CONSTRAINT "has a12"
    FOREIGN KEY ("DepartmentName")
    REFERENCES "Department" ("DepartmentName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actor"
  ADD CONSTRAINT "has a14"
    FOREIGN KEY ("UniversityName", "DepartmentName")
    REFERENCES "University" ("UniversityName", "DepartmentName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "MovieCast"
  ADD CONSTRAINT "has a10"
    FOREIGN KEY ("ReleaseDate", "MovieName")
    REFERENCES "Movie" ("ReleaseDate", "MovieName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "MovieCast"
  ADD CONSTRAINT "has a13"
    FOREIGN KEY ("ActorID")
    REFERENCES "Actor" ("ActorID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Director"
  ADD CONSTRAINT "has a17"
    FOREIGN KEY ("City", "State/Province", "Country")
    REFERENCES "Location" ("City", "State/Province", "Country")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actor"
  ADD CONSTRAINT "has a15"
    FOREIGN KEY ("City", "State/Province", "Country")
    REFERENCES "Location" ("City", "State/Province", "Country")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Director"
  ADD CONSTRAINT "has a16"
    FOREIGN KEY ("UniversityName", "DepartmentName")
    REFERENCES "University" ("UniversityName", "DepartmentName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

INSERT INTO "Director"("DirectorID", "City", "State/Province", "Country", "UniversityName", "DepartmentName", "FirstName", "LastName", "YearOfBirth")
VALUES (100,'Oshawa', 'Ontario', 'Canada','uoit' , 'Computer science', 'Jack', 'Shen', '1995-05-05') RETURNING *;

INSERT INTO public."Actor"(
	"ActorID", "UniversityName", "DepartmentName", "City", "State/Province", "Country", "DateOfBirth", "LastName", "FirstName")
	VALUES (101, 'Uoit', 'Computer-science', 'oshawa', 'Ontario', 'Canada', '1995-05-05', 'Mr', 'Jack');




INSERT INTO "Location" ("City", "State/Province", "Country") VALUES ('Oshawa', 'Ontario', 'Canada') ;
INSERT INTO "Location" ("City", "State/Province", "Country") VALUES ('Toronto', 'Ontario', 'Canada') ;
INSERT INTO "Location" ("City", "State/Province", "Country") VALUES ('Los Angeles', 'California', 'USA') ;
INSERT INTO "Location" ("City", "State/Province", "Country") VALUES ('London', 'Ontario', 'Canada') ;
INSERT INTO "Location" ("City", "State/Province", "Country") VALUES ('Houston', 'Texas', 'USA') ;

INSERT INTO public."Award"("AwardName")VALUES ('Oscar');
INSERT INTO public."Award"("AwardName")VALUES ('The academy award');
INSERT INTO public."Award"("AwardName")VALUES ('The bAfta awards');
INSERT INTO public."Award"("AwardName")VALUES ('The golden Gloves');
INSERT INTO public."Award"("AwardName")VALUES ('The Brit Awards');

Movie & Academic Database System Implementation

This repository contains my complete database coursework and lab implementations. It covers initial database conceptual design with ER/UML diagrams, table creation in PostgreSQL, detailed SQL querying, Python integration for data extraction, and XML/XQuery processing for semi-structured data.

Project Overview & ER Diagram

The overall system architecture models two main domain areas: academic structure (Faculties, Students, Departments, Courses) and a media management network (Movies, Directors, Actors, Cinemas, and Tickets).

1. Project Overview & ER Diagram

The overall system architecture models two main domain areas: academic structure (Faculties, Students, Departments, Courses) and a media management network (Movies, Directors, Actors, Cinemas, and Tickets).

2. Database Schema & Tables Setup

The relational model was implemented in PostgreSQL (lab05 database). Below are the main tables along with their primary key (PK) and foreign key (FK) setups:
```mermaid
erDiagram

    ACTOR {
        int ActorID PK
        string FirstName
        string LastName
        date DateOfBirth
        string UniversityName
        string DepartmentName
    }

    MOVIE {
        string MovieName PK
        date ReleaseDate PK
        decimal Rating
        decimal Budget
    }

    DIRECTOR {
        int DirectorID PK
        string FirstName
        string LastName
        string UniversityName
        string DepartmentName
        int YearOfBirth
    }

    CINEMA {
        int CinemaID PK
        string CinemaName
        string City
        string StateProvince
        string Country
    }

    MOVIE_CAST {
        int ActorID PK, FK
        string MovieName PK, FK
        date ReleaseDate PK, FK
    }

    DIRECTOR_CAST {
        int DirectorID FK
        string MovieName FK
        date ReleaseDate FK
    }

    MOVIE_TICKET {
        int TicketID PK
        int CinemaID FK
        decimal Price
        time ShowingTime
    }

    ACTOR ||--o{ MOVIE_CAST : "acts in"
    MOVIE ||--o{ MOVIE_CAST : "has actors"

    DIRECTOR ||--o{ DIRECTOR_CAST : "directs"
    MOVIE ||--o{ DIRECTOR_CAST : "has directors"

    CINEMA ||--o{ MOVIE_TICKET : "sells"
```



The database uses primary and foreign keys to establish relationships between entities and supports tracking movie releases, cast members, directors, cinema locations, ticket prices, and showing times.

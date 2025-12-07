CREATE TABLE Person (
    Person_id INT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    middlename VARCHAR(50),
    birth_date DATE NOT NULL,
    Death_Date DATE,
    Birth_place VARCHAR(50),
    Biography TEXT
);
CREATE TABLE Person_Role (
    role_id INT PRIMARY KEY,
    person_id INT NOT NULL,
    name_role VARCHAR(50) NOT NULL,
    FOREIGN KEY (person_id) REFERENCES Person (Person_id)
);

CREATE TABLE Movie_Person_Role (
    movie_person_id INT PRIMARY KEY,
    movie_id INT NOT NULL,
    person_id INT NOT NULL,
    role_id INT NOT NULL,
    character_name VARCHAR(50),
    FOREIGN KEY (person_id) REFERENCES Person (Person_id),
    FOREIGN KEY (role_id) REFERENCES Person_Role (role_id)
);
CREATE TABLE "User" (
    user_id INT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Email TEXT NOT NULL UNIQUE,
    registration_date DATE NOT NULL,
    PassHash VARCHAR(256) NOT NULL
);

CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    Movie_id INT NOT NULL,
    Title VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    created_at DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES "User" (user_id)
);
CREATE TABLE Movie (
    Movie_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    Release_Year DATE,
    Duration INT NOT NULL,
    Description TEXT,
    Budget BIGINT,
    Revenue BIGINT,
    Age_Rating VARCHAR(6) NOT NULL
);






CREATE TABLE Fav_Films (
    user_id INT NOT NULL,
    Movie_id INT NOT NULL,
    PRIMARY KEY (user_id, Movie_id),
    FOREIGN KEY (user_id) REFERENCES "User"(user_id),
    FOREIGN KEY (Movie_id) REFERENCES Movie(movie_id)  -- если таблица Movie существует
);

CREATE TABLE movie_watched (
    user_id INT NOT NULL,
    Movie_id INT NOT NULL,
    Time_watched_by_film INT NOT NULL,
    PRIMARY KEY (user_id, Movie_id),
    FOREIGN KEY (user_id) REFERENCES "User"(user_id),
    FOREIGN KEY (Movie_id) REFERENCES Movie(movie_id)
);
CREATE TABLE Genre (
    genre_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE Movie_Genre (
    movie_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(Movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);
CREATE TABLE Country (
    country_id INT PRIMARY KEY,
    name_country VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE Company (
    company_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    country_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);
CREATE TABLE movie_company (
    movie_id INT NOT NULL,
    company_id INT NOT NULL,
    PRIMARY KEY (movie_id, company_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(Movie_id),
    FOREIGN KEY (company_id) REFERENCES Company(company_id)
);
CREATE TABLE movie_country (
    movie_id INT NOT NULL,
    country_id INT NOT NULL,
    PRIMARY KEY (movie_id, country_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(Movie_id),
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

CREATE TABLE video_quality
(
	video_quality_id int PRIMARY KEY,
	video_quality text NOT NULL 
);

CREATE TABLE production_year
(
	production_year_id int PRIMARY KEY,
	year_is int NOT NULL 
);

CREATE TABLE screenwriter
(
	screenwriter_id int PRIMARY KEY,
	full_name text NOT NULL
);

CREATE TABLE director
(
	director_id int PRIMARY KEY,
	full_name text NOT NULL
);

CREATE TABLE producer
(
	producer_id int PRIMARY KEY,
	full_name text NOT NULL
);

CREATE TABLE film
(
    film_id integer PRIMARY KEY NOT NULL,
    name text NOT NULL,
	rating_viewer int NOT NULL,
	oscar int NOT NULL,
	age int NOT NULL,
	rating_MPAA text NOT NULL,
	duration_in_minutes int NOT NULL,
    video_quality integer REFERENCES video_quality(video_quality_id) NOT NULL,
	production_year integer REFERENCES production_year(production_year_id) NOT NULL,
	screenwriter integer  REFERENCES screenwriter(screenwriter_id)NOT NULL,
	director integer  REFERENCES director(director_id)NOT NULL,
	producer integer  REFERENCES producer(producer_id)NOT NULL
    
);

CREATE TABLE statistics
(
	statistics_id int PRIMARY KEY,
	budget text NOT NULL,
	marketing text NOT NULL,
	US_fees text NOT NULL,
	Fees_in_the_world text NOT NULL,
	fk_statistics_film int REFERENCES film(film_id)
);

CREATE TABLE rental
(
	rental_id int PRIMARY KEY,
	premiere_in_Russia date NOT NULL,
	premiere_in_world date NOT NULL,
	DVD_release date NOT NULL,
	fk_rental_film int REFERENCES film(film_id)
);

CREATE TABLE viewers
(
	viewers_id int PRIMARY KEY,
	in_Russia int NOT NULL,
	in_USA int NOT NULL,
	in_Germany int NOT NULL,
	in_France int NOT NULL,
	in_Italy int NOT NULL,
	in_China int NOT NULL,
	fk_viewers_film int REFERENCES film(film_id)
);

CREATE TABLE country
(
	country_id int PRIMARY KEY,
	country text NOT NULL 
);

CREATE TABLE film_country
(
	film_id int REFERENCES film(film_id),
	country_id int REFERENCES country(country_id),
	
	CONSTRAINT film_country_pk PRIMARY KEY (film_id, country_id)
);
	

CREATE TABLE genre
(
    genre_id integer NOT NULL,
    genre character varying(20) NOT NULL,
    PRIMARY KEY (genre_id)
);

	
CREATE TABLE film_genre
(
	film_id int REFERENCES film(film_id),
	genre_id int REFERENCES genre(genre_id),
	
	CONSTRAINT film_genre_pk PRIMARY KEY (film_id, genre_id)
);

CREATE TABLE person
(
	persone_id int PRIMARY KEY,
	rull_name text NOT NULL,
	job_title text NOT NULL
);

CREATE TABLE film_person
(
	film_id int REFERENCES film(film_id),
	persone_id int REFERENCES person(persone_id),
	
	CONSTRAINT film_person_pk PRIMARY KEY (film_id, persone_id)
);

CREATE TABLE person_in_film
(
	person_in_film_id int PRIMARY KEY,
	full_name text NOT NULL,
	role_in_film text NOT NULL
);


CREATE TABLE film_person_in_film
(
	film_id int REFERENCES film(film_id),
	person_in_film_id int REFERENCES person_in_film(person_in_film_id),
	
	CONSTRAINT film_person_in_film_pk PRIMARY KEY (film_id, person_in_film_id)
);

CREATE TABLE audio_tracks
(
	audio_tracks_id int PRIMARY KEY,
	language_of_track text NOT NULL 
);


CREATE TABLE film_audio_tracks
(
	film_id int REFERENCES film(film_id),
	audio_tracks_id int REFERENCES audio_tracks(audio_tracks_id),
	
	CONSTRAINT film_audio_tracks_pk PRIMARY KEY (film_id, audio_tracks_id)
);

CREATE TABLE subtitles
(
	subtitles_id int PRIMARY KEY,
	language_of_subtitles text NOT NULL 
);


CREATE TABLE film_subtitles
(
	film_id int REFERENCES film(film_id),
	subtitles_id int REFERENCES subtitles(subtitles_id),
	
	CONSTRAINT film_subtitles_pk PRIMARY KEY (film_id, subtitles_id)
);




CREATE TABLE stars (
    star TEXT PRIMARY KEY,
    star_temp_K INT NOT NULL --temp_k (you already know it's about stars)
);

CREATE TABLE planets (
    planet TEXT PRIMARY KEY,
    orbital_period_yrs FLOAT NOT NULL,
    star_name TEXT NOT NULL REFERENCES stars --This could've just stayed star
);

CREATE TABLE moons (
    moon TEXT PRIMARY KEY,
    planet_name TEXT NOT NULL REFERENCES planets --This could've just stayed planet
);

INSERT INTO stars
    (star, star_temp_K)
VALUES
    ('The Sun', 5800),
    ('Proxima Centauri', 3042),
    ('Gliese 876', 3192);

INSERT INTO planets
    (planet, orbital_period_yrs, star_name)
VALUES
    ('Earth', 1.00, 'The Sun'),
    ('Mars', 1.882, 'The Sun'),
    ('Venus', 0.62, 'The Sun'),
    ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
    ('Gliese 876 b', 0.236, 'Gliese 876');

INSERT INTO moons
    (moon, planet_name)
VALUES
    ('The Moon', 'Earth'),
    ('Phobos', 'Mars'),
    ('Deimos', 'Mars');

SELECT planet, star, COUNT(moons.moon) AS moon_count
    FROM planets
    JOIN stars ON planets.star_name = stars.star
    LEFT JOIN moons ON moons.planet_name = planets.planet
    GROUP BY planet, star;
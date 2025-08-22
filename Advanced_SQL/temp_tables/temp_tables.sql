-- Create a temporary table that exists only for the current session
CREATE TEMPORARY TABLE temp_table(
    first_name varchar(100),
    last_name varchar(100),
    favorite_movie varchar(100)
);

-- Selecting from the empty temporary table (no rows yet)
SELECT *
FROM temp_table;

-- Insert a row into the temporary table
INSERT INTO temp_table
VALUES ('FIRST NAME', 'LAST NAME', 'FAVORITE MOVIE');

-- Selecting again will now show the inserted row
SELECT *
FROM temp_table;


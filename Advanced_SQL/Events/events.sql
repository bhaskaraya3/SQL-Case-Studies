USE startersql;

DELIMITER $$
-- Event: Runs every 30 seconds
-- Deletes users who were born before 1990-12-31
CREATE EVENT delete_Retirees3
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN 
	DELETE
    FROM users
    WHERE date_of_birth < '1990-12-31';
END $$
DELIMITER ;

-- Check users table to see the effect of the event
SELECT * FROM users;

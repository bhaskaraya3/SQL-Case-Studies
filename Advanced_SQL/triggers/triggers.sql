
DELIMITER $$
-- Trigger: After inserting into admin_users, 
-- automatically insert the new record into users table
CREATE TRIGGER employee_insert2
AFTER INSERT ON admin_users
FOR EACH ROW
BEGIN
	INSERT INTO users (id, name)
	VALUES (NEW.id, NEW.name);
END $$
DELIMITER ;

-- Insert into admin_users
-- The trigger will also insert the same id and name into users table automatically
INSERT INTO admin_users (id, name, email, gender, date_of_birth, salary)
VALUES (1, 'Jacob', 'jacob@email.com', 'Male', '1990-05-15', 50000);


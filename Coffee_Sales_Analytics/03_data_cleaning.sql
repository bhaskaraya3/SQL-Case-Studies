-- Remove unused columns
ALTER TABLE coffee2 DROP COLUMN date;
ALTER TABLE coffee2 DROP COLUMN card;

-- Trim string columns
UPDATE coffee1
SET
cash_type   = TRIM(cash_type),
card        = TRIM(card),
coffee_name = TRIM(coffee_name);

-- Ensure money is numeric
UPDATE coffee1
SET money = TRIM(money);

-- Convert date format
ALTER TABLE coffee1 ADD COLUMN date1 DATE;

UPDATE coffee1
SET date1 = STR_TO_DATE(date, '%m/%d/%Y');

-- Validate missing values
SELECT *
FROM coffee1
WHERE
cash_type = '' OR
coffee_name = '' OR
money IS NULL OR
date1 IS NULL;

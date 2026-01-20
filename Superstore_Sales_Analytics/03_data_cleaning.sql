-- Remove unused column
ALTER TABLE superstore DROP COLUMN product_name;

-- Standardize numeric precision
UPDATE superstore
SET sales = ROUND(sales, 2);

-- Convert date columns
ALTER TABLE superstore MODIFY order_date DATE;
ALTER TABLE superstore MODIFY ship_date DATE;

-- Add delivery time metric
ALTER TABLE superstore ADD COLUMN delivery_days INT;

UPDATE superstore
SET delivery_days = DATEDIFF(ship_date, order_date);

-- Duplicate order validation
SELECT
order_id,
COUNT(*) AS duplicate_count
FROM superstore
GROUP BY order_id
HAVING COUNT(*) > 1;

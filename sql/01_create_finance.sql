-- Step 14. Run at the MySQL prompt connected to your RDS instance.
CREATE DATABASE IF NOT EXISTS finance_db;
USE finance_db;
CREATE TABLE IF NOT EXISTS amazon_prices (
    `date` DATE PRIMARY KEY,
    `open` DECIMAL(12,4) NOT NULL,
    `high` DECIMAL(12,4) NOT NULL,
    `low` DECIMAL(12,4) NOT NULL,
    `close` DECIMAL(12,4) NOT NULL,
    adj DECIMAL(12,4) NOT NULL,
    volume BIGINT UNSIGNED NOT NULL
);
DESCRIBE amazon_prices;
SELECT COUNT(*) AS existing_rows FROM amazon_prices;
-- IF NOT EXISTS does not validate the structure of an older table.

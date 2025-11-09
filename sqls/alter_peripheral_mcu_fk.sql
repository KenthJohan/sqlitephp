-- ClickHouse doesn't support traditional foreign keys, but we can simulate them
-- First, drop the existing mcu column
ALTER TABLE peripherals DROP COLUMN mcu;

-- Add a new mcu_name column that references the mcu table
ALTER TABLE peripherals ADD COLUMN mcu_name String DEFAULT 'Unknown';

-- Note: In ClickHouse, foreign key constraints are not enforced at the database level
-- You need to ensure referential integrity in your application logic
-- You can use JOINs to verify relationships:
-- 
-- Example query to check referential integrity:
-- SELECT p.name, p.mcu_name, m.name as valid_mcu
-- FROM peripherals p
-- LEFT JOIN mcu m ON p.mcu_name = m.name
-- WHERE m.name IS NULL AND p.mcu_name != 'Unknown';
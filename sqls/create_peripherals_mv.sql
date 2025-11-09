-- Materialized view that denormalizes the relationship
-- This pre-joins the data for fast analytical queries
CREATE MATERIALIZED VIEW peripherals_with_mcu_mv
ENGINE = MergeTree
ORDER BY (mcu_family, mcu_name, address)
AS SELECT 
    p.name,
    p.description,
    p.address,
    p.offset,
    p.size,
    p.mcu_id,
    m.name as mcu_name,
    m.family as mcu_family,
    m.manufacturer as mcu_manufacturer
FROM peripherals p
JOIN mcu m ON p.mcu_id = m.id;

-- This view automatically updates when data is inserted into peripherals or mcu tables
-- Query example:
-- SELECT mcu_family, count() as peripheral_count 
-- FROM peripherals_with_mcu_mv 
-- GROUP BY mcu_family;
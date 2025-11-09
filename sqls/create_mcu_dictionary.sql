-- Create MCU dictionary for ultra-fast lookups
-- This is stored in memory and provides O(1) lookups
CREATE DICTIONARY mcu_dict (
    id UInt16,
    name String,
    family String,
    manufacturer String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(HOST 'localhost' PORT 9000 USER 'default' TABLE 'mcu' DB 'default'))
LIFETIME(MIN 300 MAX 3600)  -- Cache for 5-60 minutes
LAYOUT(FLAT());             -- Best for small, dense integer keys

-- Usage example:
-- SELECT 
--   p.name,
--   dictGet('mcu_dict', 'name', p.mcu_id) as mcu_name,
--   dictGet('mcu_dict', 'family', p.mcu_id) as mcu_family
-- FROM peripherals p;
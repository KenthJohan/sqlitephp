-- Optimized MCU table with integer ID
CREATE TABLE IF NOT EXISTS `mcu` (
  `id` UInt16,           -- Primary key (enforced by application)
  `name` String,
  `family` String DEFAULT '',
  `manufacturer` String DEFAULT 'STMicroelectronics'
)
ENGINE = MergeTree
ORDER BY id;

-- Index on name for fast lookups
-- ALTER TABLE mcu ADD INDEX idx_name name TYPE bloom_filter GRANULARITY 1;
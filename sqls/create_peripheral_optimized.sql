-- Optimized peripherals table with integer foreign key
CREATE TABLE IF NOT EXISTS `peripherals` (
  `name` String,
  `description` String,
  `address` UInt32,
  `offset` UInt32,
  `size` UInt32,
  `mcu_name` String DEFAULT '?'    -- Foreign key to mcu.name 
)
ENGINE = MergeTree
PARTITION BY mcu_name           -- Physical partitioning by MCU
ORDER BY (mcu_id, address);     -- Partition by MCU first, then address

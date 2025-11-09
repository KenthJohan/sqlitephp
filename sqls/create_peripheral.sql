CREATE TABLE IF NOT EXISTS `peripherals` (
  `name` String,
  `description` String,
  `address` UInt32,
  `offset` UInt32,
  `size` UInt32,
  `mcu_name` String DEFAULT 'Unknown'  -- References mcu.name (foreign key simulation)
)
ENGINE = MergeTree
ORDER BY address;
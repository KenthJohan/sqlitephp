CREATE TABLE IF NOT EXISTS `peripherals` (
  `name` String,
  `description` String,
  `address` UInt32,
  `offset` UInt32,
  `size` UInt32
)
ENGINE = MergeTree
ORDER BY address;
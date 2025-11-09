CREATE TABLE IF NOT EXISTS `mcu` (
  `name` String
)
ENGINE = MergeTree
ORDER BY name;
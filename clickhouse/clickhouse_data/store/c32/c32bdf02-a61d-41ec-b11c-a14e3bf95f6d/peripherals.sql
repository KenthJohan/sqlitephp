ATTACH TABLE _ UUID '31c73b48-8fb9-4cda-930a-368b038f610e'
(
    `name` String,
    `description` String,
    `address` UInt32,
    `offset` UInt32,
    `size` UInt32
)
ENGINE = MergeTree
ORDER BY address
SETTINGS index_granularity = 8192

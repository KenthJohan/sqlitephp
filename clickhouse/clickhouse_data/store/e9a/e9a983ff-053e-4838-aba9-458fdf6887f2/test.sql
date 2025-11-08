ATTACH TABLE _ UUID '8a775b10-b6ec-4834-b56f-d3dc631bf611'
(
    `id` UInt64,
    `value` String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192

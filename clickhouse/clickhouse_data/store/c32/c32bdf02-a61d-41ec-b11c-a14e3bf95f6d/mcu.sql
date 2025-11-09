ATTACH TABLE _ UUID '57e94348-221e-4bad-b36f-15415cf0663b'
(
    `name` String
)
ENGINE = MergeTree
ORDER BY name
SETTINGS index_granularity = 8192

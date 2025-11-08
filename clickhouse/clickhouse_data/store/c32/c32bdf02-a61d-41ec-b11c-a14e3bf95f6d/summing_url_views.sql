ATTACH TABLE _ UUID 'e220a261-82b3-4ac1-a002-5752400d5fd2'
(
    `event_date` Date DEFAULT toDate(event_time),
    `event_time` DateTime,
    `site_id` Int32,
    `site_key` String,
    `views` Int32,
    `v_00` Int32,
    `v_55` Int32
)
ENGINE = SummingMergeTree
PARTITION BY event_date
ORDER BY (site_id, site_key, event_time, event_date)
SETTINGS index_granularity = 8192

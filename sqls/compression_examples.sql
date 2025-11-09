-- Example showing different compression codecs for repeated values
CREATE TABLE compression_example (
    -- Delta encoding - excellent for sequential or slowly changing values
    timestamp DateTime CODEC(DoubleDelta, LZ4),
    
    -- LZ4 - fast compression, good for repeated strings
    mcu_name String CODEC(LZ4),
    
    -- Dictionary encoding - perfect for low-cardinality repeated values
    status LowCardinality(String) CODEC(LZ4),
    
    -- Delta + LZ4 for incremental addresses
    address UInt32 CODEC(Delta, LZ4),
    
    -- ZSTD for high compression ratio on repeated data
    description String CODEC(ZSTD),
    
    -- Combination codecs for maximum efficiency
    register_value UInt32 CODEC(Delta, ZSTD(3))
)
ENGINE = MergeTree
ORDER BY timestamp;
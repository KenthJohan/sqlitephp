-- Highly optimized table for STM32 peripheral data
CREATE TABLE peripherals_optimized (
    -- Efficient integer foreign key
    mcu_id UInt16,
    
    -- LowCardinality for repeated peripheral types
    peripheral_type LowCardinality(String),  -- GPIO, UART, SPI, I2C, etc.
    
    -- Peripheral name (not many repeats, keep as String)
    name String,
    
    -- Delta encoding for sequential addresses
    address UInt32 CODEC(Delta, LZ4),
    
    -- Size typically has few unique values
    size LowCardinality(UInt32),
    
    -- Register count with delta encoding
    register_count UInt16 CODEC(Delta, LZ4),
    
    -- Description with high compression
    description String CODEC(ZSTD(3))
)
ENGINE = MergeTree
PARTITION BY mcu_id                    -- Physical partitioning by MCU
ORDER BY (mcu_id, peripheral_type, address)  -- Logical ordering for compression
SETTINGS index_granularity = 8192;    -- Default granularity

-- Sample data showing compression efficiency:
-- INSERT INTO peripherals_optimized VALUES
-- (1, 'GPIO', 'GPIOA', 0x40020000, 1024, 12, 'General Purpose I/O Port A'),
-- (1, 'GPIO', 'GPIOB', 0x40020400, 1024, 12, 'General Purpose I/O Port B'),
-- (1, 'GPIO', 'GPIOC', 0x40020800, 1024, 12, 'General Purpose I/O Port C');
-- 
-- The 'GPIO' values compress to almost nothing due to LowCardinality
-- The addresses compress well with Delta encoding (0x400 differences)
-- The sizes are identical (perfect for LowCardinality)
-- The register_counts are identical (perfect compression)
-- Create table for peripherals
CREATE TABLE IF NOT EXISTS `peripherals` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` TEXT NOT NULL,
  `description` TEXT,
  `baseAddress` INTEGER NOT NULL,
  `offset` INTEGER,
  `size` INTEGER,
  `derivedFrom` TEXT,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO `peripherals` (`name`, `description`, `address`, `offset`, `size`, `mcu_name`) VALUES
  ('ADC_Common', 'ADC common registers', 0x40012300, 0x0, 0x9, 'STM32F401'),
  ('ADC1', 'Analog-to-digital converter', 0x40012000, 0x0, 0x51, 'STM32F401'),
  ('CRC', 'Cryptographic processor', 0x40023000, 0x0, 0x400, 'STM32F401'),
  ('DBG', 'Debug support', 0xE0042000, 0x0, 0x400, 'STM32F401'),
  ('EXTI', 'External interrupt/event
      controller', 0x40013C00, 0x0, 0x400, 'STM32F401'),
  ('FLASH', 'FLASH', 0x40023C00, 0x0, 0x400, 'STM32F401'),
  ('IWDG', 'Independent watchdog', 0x40003000, 0x0, 0x400, 'STM32F401'),
  ('OTG_FS_DEVICE', 'USB on the go full speed', 0x50000800, 0x0, 0x400, 'STM32F401'),
  ('OTG_FS_GLOBAL', 'USB on the go full speed', 0x50000000, 0x0, 0x400, 'STM32F401'),
  ('OTG_FS_HOST', 'USB on the go full speed', 0x50000400, 0x0, 0x400, 'STM32F401'),
  ('OTG_FS_PWRCLK', 'USB on the go full speed', 0x50000E00, 0x0, 0x400, 'STM32F401'),
  ('PWR', 'Power control', 0x40007000, 0x0, 0x400, 'STM32F401'),
  ('RCC', 'Reset and clock control', 0x40023800, 0x0, 0x400, 'STM32F401'),
  ('RTC', 'Real-time clock', 0x40002800, 0x0, 0x400, 'STM32F401'),
  ('SDIO', 'Secure digital input/output
      interface', 0x40012C00, 0x0, 0x400, 'STM32F401'),
  ('SYSCFG', 'System configuration controller', 0x40013800, 0x0, 0x400, 'STM32F401'),
  ('TIM1', 'Advanced-timers', 0x40010000, 0x0, 0x400, 'STM32F401'),
  ('TIM8', 'Advanced-timers', 0x40010400, 0x0, 0x400, 'STM32F401'),
  ('TIM10', 'General-purpose-timers', 0x40014400, 0x0, 0x400, 'STM32F401'),
  ('TIM11', 'General-purpose-timers', 0x40014800, 0x0, 0x400, 'STM32F401'),
  ('TIM2', 'General purpose timers', 0x40000000, 0x0, 0x400, 'STM32F401'),
  ('TIM3', 'General purpose timers', 0x40000400, 0x0, 0x400, 'STM32F401'),
  ('TIM4', 'General purpose timers', 0x40000800, 0x0, 0x400, 'STM32F401'),
  ('TIM5', 'General-purpose-timers', 0x40000C00, 0x0, 0x400, 'STM32F401'),
  ('TIM9', 'General purpose timers', 0x40014000, 0x0, 0x400, 'STM32F401'),
  ('USART1', 'Universal synchronous asynchronous receiver
      transmitter', 0x40011000, 0x0, 0x400, 'STM32F401'),
  ('USART2', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004400, 0x0, 0x400, 'STM32F401'),
  ('USART6', 'Universal synchronous asynchronous receiver
      transmitter', 0x40011400, 0x0, 0x400, 'STM32F401'),
  ('WWDG', 'Window watchdog', 0x40002C00, 0x0, 0x400, 'STM32F401'),
  ('DMA2', 'DMA controller', 0x40026400, 0x0, 0x400, 'STM32F401'),
  ('DMA1', 'DMA controller', 0x40026000, 0x0, 0x400, 'STM32F401'),
  ('GPIOH', 'General-purpose I/Os', 0x40021C00, 0x0, 0x400, 'STM32F401'),
  ('GPIOE', 'General-purpose I/Os', 0x40021000, 0x0, 0x400, 'STM32F401'),
  ('GPIOD', 'General-purpose I/Os', 0X40020C00, 0x0, 0x400, 'STM32F401'),
  ('GPIOC', 'General-purpose I/Os', 0x40020800, 0x0, 0x400, 'STM32F401'),
  ('GPIOB', 'General-purpose I/Os', 0x40020400, 0x0, 0x400, 'STM32F401'),
  ('GPIOA', 'General-purpose I/Os', 0x40020000, 0x0, 0x400, 'STM32F401'),
  ('I2C3', 'Inter-integrated circuit', 0x40005C00, 0x0, 0x400, 'STM32F401'),
  ('I2C2', 'Inter-integrated circuit', 0x40005800, 0x0, 0x400, 'STM32F401'),
  ('I2C1', 'Inter-integrated circuit', 0x40005400, 0x0, 0x400, 'STM32F401'),
  ('I2S2ext', 'Serial peripheral interface', 0x40003400, 0x0, 0x400, 'STM32F401'),
  ('I2S3ext', 'Serial peripheral interface', 0x40004000, 0x0, 0x400, 'STM32F401'),
  ('SPI1', 'Serial peripheral interface', 0x40013000, 0x0, 0x400, 'STM32F401'),
  ('SPI2', 'Serial peripheral interface', 0x40003800, 0x0, 0x400, 'STM32F401'),
  ('SPI3', 'Serial peripheral interface', 0x40003C00, 0x0, 0x400, 'STM32F401'),
  ('SPI4', 'Serial peripheral interface', 0x40013400, 0x0, 0x400, 'STM32F401');

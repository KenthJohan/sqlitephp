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
  ('GPIOA', 'General-purpose I/Os', 0x48000000, 0x0, 0x400, 'STM32F301'),
  ('GPIOB', 'General-purpose I/Os', 0x48000400, 0x0, 0x400, 'STM32F301'),
  ('GPIOC', 'General-purpose I/Os', 0x48000800, 0x0, 0x400, 'STM32F301'),
  ('GPIOD', 'General-purpose I/Os', 0x48000C00, 0x0, 0x400, 'STM32F301'),
  ('GPIOF', 'General-purpose I/Os', 0x48001400, 0x0, 0x400, 'STM32F301'),
  ('TSC', 'Touch sensing controller', 0x40024000, 0x0, 0x400, 'STM32F301'),
  ('CRC', 'cyclic redundancy check calculation
      unit', 0x40023000, 0x0, 0x400, 'STM32F301'),
  ('Flash', 'Flash', 0x40022000, 0x0, 0x400, 'STM32F301'),
  ('RCC', 'Reset and clock control', 0x40021000, 0x0, 0x400, 'STM32F301'),
  ('DMA1', 'DMA controller 1', 0x40020000, 0x0, 0x400, 'STM32F301'),
  ('TIM2', 'General purpose timer', 0x40000000, 0x0, 0x400, 'STM32F301'),
  ('TIM15', 'General purpose timers', 0x40014000, 0x0, 0x400, 'STM32F301'),
  ('TIM16', 'General-purpose-timers', 0x40014400, 0x0, 0x400, 'STM32F301'),
  ('TIM17', 'General-purpose-timers', 0x40014800, 0x0, 0x400, 'STM32F301'),
  ('USART1', 'Universal synchronous asynchronous receiver
      transmitter', 0x40013800, 0x0, 0x400, 'STM32F301'),
  ('USART2', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004400, 0x0, 0x400, 'STM32F301'),
  ('USART3', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004800, 0x0, 0x400, 'STM32F301'),
  ('SPI2', 'Serial peripheral interface/Inter-IC
      sound', 0x40003800, 0x0, 0x400, 'STM32F301'),
  ('SPI3', 'Serial peripheral interface/Inter-IC
      sound', 0x40003C00, 0x0, 0x400, 'STM32F301'),
  ('I2S2ext', 'Serial peripheral interface/Inter-IC
      sound', 0x40003400, 0x0, 0x400, 'STM32F301'),
  ('I2S3ext', 'Serial peripheral interface/Inter-IC
      sound', 0x40004000, 0x0, 0x400, 'STM32F301'),
  ('ADC', 'Analog to digital converter', 0x50000000, 0x0, 0x400, 'STM32F301'),
  ('EXTI', 'External interrupt/event
      controller', 0x40010400, 0x0, 0x400, 'STM32F301'),
  ('PWR', 'Power control', 0x40007000, 0x0, 0x400, 'STM32F301'),
  ('I2C1', 'Inter-integrated circuit', 0x40005400, 0x0, 0x400, 'STM32F301'),
  ('I2C2', 'Inter-integrated circuit', 0x40005800, 0x0, 0x400, 'STM32F301'),
  ('I2C3', 'Inter-integrated circuit', 0x40007800, 0x0, 0x400, 'STM32F301'),
  ('IWDG', 'Independent watchdog', 0x40003000, 0x0, 0x400, 'STM32F301'),
  ('WWDG', 'Window watchdog', 0x40002C00, 0x0, 0x400, 'STM32F301'),
  ('RTC', 'Real-time clock', 0x40002800, 0x0, 0x400, 'STM32F301'),
  ('TIM6', 'Basic timers', 0x40001000, 0x0, 0x400, 'STM32F301'),
  ('DAC1', 'Digital-to-analog converter', 0x40007400, 0x0, 0x400, 'STM32F301'),
  ('DBGMCU', 'Debug support', 0xE0042000, 0x0, 0x400, 'STM32F301'),
  ('SYSCFG_COMP_OPAMP', 'System configuration controller', 0x40010000, 0x0, 0x400, 'STM32F301'),
  ('TIM1', 'Advanced-timers', 0x40012C00, 0x0, 0x400, 'STM32F301');

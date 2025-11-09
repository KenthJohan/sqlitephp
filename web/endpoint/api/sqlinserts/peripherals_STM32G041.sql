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
  ('IWDG', 'Independent watchdog', 0x40003000, 0x0, 0x400, 'STM32G041'),
  ('WWDG', 'System window watchdog', 0x40002C00, 0x0, 0x400, 'STM32G041'),
  ('FLASH', 'Flash', 0x40022000, 0x0, 0x400, 'STM32G041'),
  ('RCC', 'Reset and clock control', 0x40021000, 0x0, 0x400, 'STM32G041'),
  ('PWR', 'Power control', 0x40007000, 0x0, 0x400, 'STM32G041'),
  ('DMA1', 'DMA controller', 0x40020000, 0x0, 0x400, 'STM32G041'),
  ('DMA2', 'DMA controller', 0x40020400, 0x0, 0x400, 'STM32G041'),
  ('DMAMUX', 'DMAMUX', 0x40020800, 0x0, 0x400, 'STM32G041'),
  ('GPIOA', 'General-purpose I/Os', 0x50000000, 0x0, 0x400, 'STM32G041'),
  ('GPIOB', 'General-purpose I/Os', 0x50000400, 0x0, 0x400, 'STM32G041'),
  ('GPIOC', 'General-purpose I/Os', 0x50000800, 0x0, 0x400, 'STM32G041'),
  ('GPIOD', 'General-purpose I/Os', 0x50000C00, 0x0, 0x400, 'STM32G041'),
  ('GPIOF', 'General-purpose I/Os', 0x50001400, 0x0, 0x400, 'STM32G041'),
  ('AES', 'Advanced encryption standard hardware
      accelerator 1', 0x40026000, 0x0, 0x400, 'STM32G041'),
  ('RNG', 'Random number generator', 0x40025000, 0x0, 0x400, 'STM32G041'),
  ('CRC', 'Cyclic redundancy check calculation
      unit', 0x40023000, 0x0, 0x400, 'STM32G041'),
  ('EXTI', 'External interrupt/event
      controller', 0x40021800, 0x0, 0x400, 'STM32G041'),
  ('TIM16', 'General purpose timers', 0x40014400, 0x0, 0x400, 'STM32G041'),
  ('TIM17', 'General purpose timers', 0x40014800, 0x0, 0x400, 'STM32G041'),
  ('USART1', 'Universal synchronous asynchronous receiver
      transmitter', 0x40013800, 0x0, 0x400, 'STM32G041'),
  ('USART2', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004400, 0x0, 0x400, 'STM32G041'),
  ('SPI1', 'Serial peripheral interface/Inter-IC
      sound', 0x40013000, 0x0, 0x400, 'STM32G041'),
  ('SPI2', 'Serial peripheral interface/Inter-IC
      sound', 0x40003800, 0x0, 0x400, 'STM32G041'),
  ('TIM1', 'Advanced-timers', 0x40012C00, 0x0, 0x400, 'STM32G041'),
  ('ADC', 'Analog to Digital Converter instance
      1', 0x40012400, 0x0, 0x400, 'STM32G041'),
  ('SYSCFG', 'System configuration controller', 0x40010000, 0x0, 0x100, 'STM32G041'),
  ('TAMP', 'Tamper and backup registers', 0x4000B000, 0x0, 0x400, 'STM32G041'),
  ('LPTIM1', 'Low power timer', 0x40007C00, 0x0, 0x400, 'STM32G041'),
  ('LPTIM2', 'Low power timer', 0x40009400, 0x0, 0x400, 'STM32G041'),
  ('LPUART', 'Universal synchronous asynchronous receiver
      transmitter', 0x40008000, 0x0, 0x400, 'STM32G041'),
  ('I2C1', 'Inter-integrated circuit', 0x40005400, 0x0, 0x400, 'STM32G041'),
  ('I2C2', 'Inter-integrated circuit', 0x40005800, 0x0, 0x400, 'STM32G041'),
  ('RTC', 'Real-time clock', 0x40002800, 0x0, 0x400, 'STM32G041'),
  ('TIM14', 'General purpose timers', 0x40002000, 0x0, 0x400, 'STM32G041'),
  ('TIM2', 'General-purpose-timers', 0x40000000, 0x0, 0x400, 'STM32G041'),
  ('TIM3', 'General-purpose-timers', 0x40000400, 0x0, 0x400, 'STM32G041'),
  ('VREFBUF', 'System configuration controller', 0x40010030, 0x0, 0x50, 'STM32G041'),
  ('DBG', 'MCU debug component', 0x40015800, 0x0, 0x400, 'STM32G041'),
  ('SYSCFG_ITLINE', 'System configuration controller', 0x40010080, 0x0, 0x180, 'STM32G041');

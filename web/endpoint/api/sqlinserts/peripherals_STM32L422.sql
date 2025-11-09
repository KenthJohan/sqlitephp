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
  ('ADC1', 'Analog-to-Digital Converter', 0x50040000, 0x0, 0xB9, 'STM32L422'),
  ('ADC2', 'Analog-to-Digital Converter', 0x50040100, 0x0, 0xB9, 'STM32L422'),
  ('ADC12_Common', 'Analog-to-Digital Converter', 0x50040300, 0x0, 0x11, 'STM32L422'),
  ('COMP', 'Comparator', 0x40010200, 0x0, 0x200, 'STM32L422'),
  ('CRC', 'Cyclic redundancy check calculation
      unit', 0x40023000, 0x0, 0x400, 'STM32L422'),
  ('CRS', 'Clock recovery system', 0x40006000, 0x0, 0x400, 'STM32L422'),
  ('DBGMCU', 'MCU debug component', 0xE0042000, 0x0, 0x400, 'STM32L422'),
  ('DMA1', 'Direct memory access controller', 0x40020000, 0x0, 0x400, 'STM32L422'),
  ('DMA2', 'Direct memory access controller', 0x40020400, 0x0, 0x400, 'STM32L422'),
  ('EXTI', 'External interrupt/event
      controller', 0x40010400, 0x0, 0x400, 'STM32L422'),
  ('FIREWALL', 'Firewall', 0x40011C00, 0x0, 0x400, 'STM32L422'),
  ('FLASH', 'Flash', 0x40022000, 0x0, 0x400, 'STM32L422'),
  ('I2C1', 'Inter-integrated circuit', 0x40005400, 0x0, 0x400, 'STM32L422'),
  ('I2C2', 'Inter-integrated circuit', 0x40005800, 0x0, 0x400, 'STM32L422'),
  ('I2C3', 'Inter-integrated circuit', 0x40005C00, 0x0, 0x400, 'STM32L422'),
  ('IWDG', 'Independent watchdog', 0x40003000, 0x0, 0x400, 'STM32L422'),
  ('LPTIM1', 'Low power timer', 0x40007C00, 0x0, 0x400, 'STM32L422'),
  ('LPTIM2', 'Low power timer', 0x40009400, 0x0, 0x400, 'STM32L422'),
  ('LPUART1', 'Universal synchronous asynchronous receiver
      transmitter', 0x40008000, 0x0, 0x400, 'STM32L422'),
  ('OPAMP', 'Operational amplifiers', 0x40007800, 0x0, 0x400, 'STM32L422'),
  ('PWR', 'Power control', 0x40007000, 0x0, 0x400, 'STM32L422'),
  ('RNG', 'Random number generator', 0x50060800, 0x0, 0x400, 'STM32L422'),
  ('RTC', 'Real-time clock', 0x40002800, 0x0, 0x400, 'STM32L422'),
  ('SPI1', 'Serial peripheral interface/Inter-IC
      sound', 0x40013000, 0x0, 0x400, 'STM32L422'),
  ('SPI2', 'Serial peripheral interface/Inter-IC
      sound', 0x40003800, 0x0, 0x400, 'STM32L422'),
  ('SYSCFG', 'System configuration controller', 0x40010000, 0x0, 0x30, 'STM32L422'),
  ('TIM1', 'Advanced-timers', 0x40012C00, 0x0, 0x400, 'STM32L422'),
  ('TIM15', 'General purpose timers', 0x40014000, 0x0, 0x400, 'STM32L422'),
  ('TIM16', 'General purpose timers', 0x40014400, 0x0, 0x400, 'STM32L422'),
  ('TIM2', 'General-purpose-timers', 0x40000000, 0x0, 0x400, 'STM32L422'),
  ('TIM6', 'Basic-timers', 0x40001000, 0x0, 0x400, 'STM32L422'),
  ('TSC', 'Touch sensing controller', 0x40024000, 0x0, 0x400, 'STM32L422'),
  ('USART1', 'Universal synchronous asynchronous receiver
      transmitter', 0x40013800, 0x0, 0x400, 'STM32L422'),
  ('WWDG', 'System window watchdog', 0x40002C00, 0x0, 0x400, 'STM32L422'),
  ('QUADSPI', 'QuadSPI interface', 0xA0001000, 0x0, 0x400, 'STM32L422'),
  ('GPIOA', 'General-purpose I/Os', 0x48000000, 0x0, 0x400, 'STM32L422'),
  ('GPIOB', 'General-purpose I/Os', 0x48000400, 0x0, 0x400, 'STM32L422'),
  ('GPIOC', 'General-purpose I/Os', 0x48000800, 0x0, 0x400, 'STM32L422'),
  ('GPIOD', 'General-purpose I/Os', 0x48000C00, 0x0, 0x400, 'STM32L422'),
  ('GPIOH', 'General-purpose I/Os', 0x48001C00, 0x0, 0x400, 'STM32L422'),
  ('RCC', 'Reset and clock control', 0x40021000, 0x0, 0x400, 'STM32L422'),
  ('USB_SRAM', 'Universal serial bus full-speed device
      interface', 0x40006C00, 0x0, 0x400, 'STM32L422'),
  ('USB_FS', 'Universal serial bus full-speed device
      interface', 0x40006800, 0x0, 0x400, 'STM32L422'),
  ('USART2', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004400, 0x0, 0x400, 'STM32L422'),
  ('USART3', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004800, 0x0, 0x400, 'STM32L422');

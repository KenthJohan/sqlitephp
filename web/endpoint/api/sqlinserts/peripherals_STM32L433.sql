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
  ('DAC1', 'Digital-to-analog converter', 0x40007400, 0x0, 0x400, 'STM32L433'),
  ('DMA1', 'Direct memory access controller', 0x40020000, 0x0, 0x400, 'STM32L433'),
  ('DMA2', 'Direct memory access controller', 0x40020400, 0x0, 0x400, 'STM32L433'),
  ('CRC', 'Cyclic redundancy check calculation
      unit', 0x40023000, 0x0, 0x400, 'STM32L433'),
  ('LCD', 'Liquid crystal display controller', 0x40002400, 0x0, 0x400, 'STM32L433'),
  ('TSC', 'Touch sensing controller', 0x40024000, 0x0, 0x400, 'STM32L433'),
  ('IWDG', 'Independent watchdog', 0x40003000, 0x0, 0x400, 'STM32L433'),
  ('WWDG', 'System window watchdog', 0x40002C00, 0x0, 0x400, 'STM32L433'),
  ('COMP', 'Comparator', 0x40010200, 0x0, 0x200, 'STM32L433'),
  ('FIREWALL', 'Firewall', 0x40011C00, 0x0, 0x400, 'STM32L433'),
  ('I2C1', 'Inter-integrated circuit', 0x40005400, 0x0, 0x400, 'STM32L433'),
  ('I2C2', 'Inter-integrated circuit', 0x40005800, 0x0, 0x400, 'STM32L433'),
  ('I2C3', 'Inter-integrated circuit', 0x40005C00, 0x0, 0x400, 'STM32L433'),
  ('FLASH', 'Flash', 0x40022000, 0x0, 0x400, 'STM32L433'),
  ('RCC', 'Reset and clock control', 0x40021000, 0x0, 0x400, 'STM32L433'),
  ('PWR', 'Power control', 0x40007000, 0x0, 0x400, 'STM32L433'),
  ('SYSCFG', 'System configuration controller', 0x40010000, 0x0, 0x30, 'STM32L433'),
  ('RNG', 'Random number generator', 0x50060800, 0x0, 0x400, 'STM32L433'),
  ('AES', 'Advanced encryption standard hardware
      accelerator', 0x50060000, 0x0, 0x400, 'STM32L433'),
  ('ADC1', 'Analog-to-Digital Converter', 0x50040000, 0x0, 0xB9, 'STM32L433'),
  ('ADC2', 'Analog-to-Digital Converter', 0x50040100, 0x0, 0xB9, 'STM32L433'),
  ('ADC3', 'Analog-to-Digital Converter', 0x50040200, 0x0, 0xB9, 'STM32L433'),
  ('ADC123_Common', 'Analog-to-Digital Converter', 0x50040300, 0x0, 0x11, 'STM32L433'),
  ('GPIOA', 'General-purpose I/Os', 0x48000000, 0x0, 0x400, 'STM32L433'),
  ('GPIOB', 'General-purpose I/Os', 0x48000400, 0x0, 0x400, 'STM32L433'),
  ('GPIOC', 'General-purpose I/Os', 0x48000800, 0x0, 0x400, 'STM32L433'),
  ('GPIOD', 'General-purpose I/Os', 0x48000C00, 0x0, 0x400, 'STM32L433'),
  ('GPIOE', 'General-purpose I/Os', 0x48001000, 0x0, 0x400, 'STM32L433'),
  ('GPIOH', 'General-purpose I/Os', 0x48001C00, 0x0, 0x400, 'STM32L433'),
  ('SAI1', 'Serial audio interface', 0x40015400, 0x0, 0x400, 'STM32L433'),
  ('TIM2', 'General-purpose-timers', 0x40000000, 0x0, 0x400, 'STM32L433'),
  ('TIM15', 'General purpose timers', 0x40014000, 0x0, 0x400, 'STM32L433'),
  ('TIM16', 'General purpose timers', 0x40014400, 0x0, 0x400, 'STM32L433'),
  ('TIM1', 'Advanced-timers', 0x40012C00, 0x0, 0x400, 'STM32L433'),
  ('TIM6', 'Basic-timers', 0x40001000, 0x0, 0x400, 'STM32L433'),
  ('TIM7', 'Basic-timers', 0x40001400, 0x0, 0x400, 'STM32L433'),
  ('LPTIM1', 'Low power timer', 0x40007C00, 0x0, 0x400, 'STM32L433'),
  ('LPTIM2', 'Low power timer', 0x40009400, 0x0, 0x400, 'STM32L433'),
  ('USART1', 'Universal synchronous asynchronous receiver
      transmitter', 0x40013800, 0x0, 0x400, 'STM32L433'),
  ('USART2', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004400, 0x0, 0x400, 'STM32L433'),
  ('USART3', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004800, 0x0, 0x400, 'STM32L433'),
  ('LPUART1', 'Universal synchronous asynchronous receiver
      transmitter', 0x40008000, 0x0, 0x400, 'STM32L433'),
  ('SPI1', 'Serial peripheral interface/Inter-IC
      sound', 0x40013000, 0x0, 0x400, 'STM32L433'),
  ('SPI2', 'Serial peripheral interface/Inter-IC
      sound', 0x40003800, 0x0, 0x400, 'STM32L433'),
  ('SPI3', 'Serial peripheral interface/Inter-IC
      sound', 0x40003C00, 0x0, 0x400, 'STM32L433'),
  ('SDMMC', 'Secure digital input/output
      interface', 0x40012800, 0x0, 0x400, 'STM32L433'),
  ('EXTI', 'External interrupt/event
      controller', 0x40010400, 0x0, 0x400, 'STM32L433'),
  ('VREFBUF', 'Voltage reference buffer', 0x40010030, 0x0, 0x1D0, 'STM32L433'),
  ('CAN1', 'Controller area network', 0x40006400, 0x0, 0x400, 'STM32L433'),
  ('RTC', 'Real-time clock', 0x40002800, 0x0, 0x400, 'STM32L433'),
  ('SWPMI1', 'Single Wire Protocol Master
      Interface', 0x40008800, 0x0, 0x400, 'STM32L433'),
  ('OPAMP', 'Operational amplifiers', 0x40007800, 0x0, 0x400, 'STM32L433'),
  ('CRS', 'Clock recovery system', 0x40006000, 0x0, 0x400, 'STM32L433'),
  ('USB_SRAM', 'Universal serial bus full-speed device
      interface', 0x40006C00, 0x0, 0x400, 'STM32L433'),
  ('USB_FS', 'Universal serial bus full-speed device
      interface', 0x40006800, 0x0, 0x400, 'STM32L433'),
  ('DBGMCU', 'MCU debug component', 0xE0042000, 0x0, 0x15, 'STM32L433');

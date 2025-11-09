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
  ('AES', 'Advanced encrytion standard hardware
      accelerator', 0x50060000, 0x0, 0x400, 'STM32L100'),
  ('COMP', 'Comparators', 0x40007C00, 0x0, 0x4, 'STM32L100'),
  ('CRC', 'CRC calculation unit', 0x40023000, 0x0, 0x400, 'STM32L100'),
  ('DAC', 'Digital-to-analog converter', 0x40007400, 0x0, 0x400, 'STM32L100'),
  ('DMA1', 'Direct memory access controller', 0x40026000, 0x0, 0x400, 'STM32L100'),
  ('DMA2', 'Direct memory access controller', 0x40026400, 0x0, 0x400, 'STM32L100'),
  ('EXTI', 'External interrupt/event
      controller', 0x40010400, 0x0, 0x400, 'STM32L100'),
  ('Flash', 'Flash', 0x40023C00, 0x0, 0x400, 'STM32L100'),
  ('FSMC', 'Flexible static memory controller', 0xA0000000, 0x0, 0x400, 'STM32L100'),
  ('GPIOA', 'General-purpose I/Os', 0x40020000, 0x0, 0x400, 'STM32L100'),
  ('GPIOB', 'General-purpose I/Os', 0x40020400, 0x0, 0x400, 'STM32L100'),
  ('GPIOC', 'General-purpose I/Os', 0x40020800, 0x0, 0x400, 'STM32L100'),
  ('GPIOD', 'General-purpose I/Os', 0x40020C00, 0x0, 0x400, 'STM32L100'),
  ('GPIOH', 'General-purpose I/Os', 0x40021400, 0x0, 0x400, 'STM32L100'),
  ('I2C1', 'Inter-integrated circuit', 0x40005400, 0x0, 0x400, 'STM32L100'),
  ('I2C2', 'Inter-integrated circuit', 0x40005800, 0x0, 0x400, 'STM32L100'),
  ('IWDG', 'Independent watchdog', 0x40003000, 0x0, 0x400, 'STM32L100'),
  ('LCD', 'Liquid crystal display controller', 0x40002400, 0x0, 0x400, 'STM32L100'),
  ('OPAMP', 'Operational amplifiers', 0x40007C5C, 0x0, 0x3A4, 'STM32L100'),
  ('PWR', 'Power control', 0x40007000, 0x0, 0x400, 'STM32L100'),
  ('RCC', 'Reset and clock control', 0x40023800, 0x0, 0x400, 'STM32L100'),
  ('RI', 'Routing interface', 0x40007C04, 0x0, 0x58, 'STM32L100'),
  ('RTC', 'Real-time clock', 0x40002800, 0x0, 0x400, 'STM32L100'),
  ('SPI1', 'Serial peripheral interface', 0x40013000, 0x0, 0x400, 'STM32L100'),
  ('SPI2', 'Serial peripheral interface', 0x40003800, 0x0, 0x400, 'STM32L100'),
  ('SPI3', 'Serial peripheral interface', 0x40003C00, 0x0, 0x400, 'STM32L100'),
  ('SYSCFG', 'System configuration controller', 0x40010000, 0x0, 0x400, 'STM32L100'),
  ('TIM10', 'General-purpose timers', 0x40010C00, 0x0, 0x400, 'STM32L100'),
  ('TIM11', 'General-purpose timers', 0x40011000, 0x0, 0x400, 'STM32L100'),
  ('TIM2', 'General-purpose timers', 0x40000000, 0x0, 0x400, 'STM32L100'),
  ('TIM3', 'General-purpose timers', 0x40000400, 0x0, 0x400, 'STM32L100'),
  ('TIM4', 'General-purpose timers', 0x40000800, 0x0, 0x400, 'STM32L100'),
  ('TIM5', 'General-purpose timers', 0x40000C00, 0x0, 0x400, 'STM32L100'),
  ('TIM6', 'Basic timers', 0x40001000, 0x0, 0x400, 'STM32L100'),
  ('TIM7', 'Basic timers', 0x40001400, 0x0, 0x400, 'STM32L100'),
  ('TIM9', 'General-purpose timers', 0x40010800, 0x0, 0x400, 'STM32L100'),
  ('USART1', 'Universal synchronous asynchronous receiver
      transmitter', 0x40013800, 0x0, 0x400, 'STM32L100'),
  ('USART2', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004400, 0x0, 0x400, 'STM32L100'),
  ('USART3', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004800, 0x0, 0x400, 'STM32L100'),
  ('USART4', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004C00, 0x0, 0x400, 'STM32L100'),
  ('USART5', 'Universal synchronous asynchronous receiver
      transmitter', 0x40005000, 0x0, 0x400, 'STM32L100'),
  ('USB', 'Universal serial bus full-speed device
      interface', 0x40005C00, 0x0, 0x400, 'STM32L100'),
  ('USB_SRAM', 'Universal serial bus full-speed device
      interface', 0x40006000, 0x0, 0x400, 'STM32L100'),
  ('WWDG', 'Window watchdog', 0x40002C00, 0x0, 0x400, 'STM32L100'),
  ('ADC', 'Analog-to-digital converter', 0x40012400, 0x0, 0x400, 'STM32L100'),
  ('DBGMCU', 'debug support', 0xE0042000, 0x0, 0x15, 'STM32L100'),
  ('SDIO', 'Secure digital input/output
      interface', 0x40012C00, 0x0, 0x400, 'STM32L100');

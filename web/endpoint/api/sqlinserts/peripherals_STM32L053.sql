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
  ('DAC', 'Digital-to-analog converter', 0x40007400, 0x0, 0x400, 'STM32L053'),
  ('DMA1', 'Direct memory access controller', 0x40020000, 0x0, 0x400, 'STM32L053'),
  ('CRC', 'Cyclic redundancy check calculation
      unit', 0x40023000, 0x0, 0x400, 'STM32L053'),
  ('GPIOA', 'General-purpose I/Os', 0x50000000, 0x0, 0x400, 'STM32L053'),
  ('GPIOB', 'General-purpose I/Os', 0x50000400, 0x0, 0x400, 'STM32L053'),
  ('GPIOC', 'General-purpose I/Os', 0x50000800, 0x0, 0x400, 'STM32L053'),
  ('GPIOD', 'General-purpose I/Os', 0x50000C00, 0x0, 0x400, 'STM32L053'),
  ('GPIOH', 'General-purpose I/Os', 0x50001C00, 0x0, 0x400, 'STM32L053'),
  ('GPIOE', 'General-purpose I/Os', 0x50001000, 0x0, 0x400, 'STM32L053'),
  ('LPTIM', 'Low power timer', 0x40007C00, 0x0, 0x400, 'STM32L053'),
  ('RNG', 'Random number generator', 0x40025000, 0x0, 0x400, 'STM32L053'),
  ('RTC', 'Real-time clock', 0x40002800, 0x0, 0x400, 'STM32L053'),
  ('USART1', 'Universal synchronous asynchronous receiver
      transmitter', 0x40013800, 0x0, 0x400, 'STM32L053'),
  ('USART2', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004400, 0x0, 0x400, 'STM32L053'),
  ('USART4', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004C00, 0x0, 0x400, 'STM32L053'),
  ('USART5', 'Universal synchronous asynchronous receiver
      transmitter', 0x40005000, 0x0, 0x400, 'STM32L053'),
  ('TSC', 'Touch sensing controller', 0x40024000, 0x0, 0x400, 'STM32L053'),
  ('IWDG', 'Independent watchdog', 0x40003000, 0x0, 0x400, 'STM32L053'),
  ('WWDG', 'System window watchdog', 0x40002C00, 0x0, 0x400, 'STM32L053'),
  ('USB_FS', 'Universal serial bus full-speed device
      interface', 0x40005C00, 0x0, 0x400, 'STM32L053'),
  ('CRS', 'Clock recovery system', 0x40006C00, 0x0, 0x400, 'STM32L053'),
  ('Firewall', 'Firewall', 0x40011C00, 0x0, 0x400, 'STM32L053'),
  ('RCC', 'Reset and clock control', 0x40021000, 0x0, 0x400, 'STM32L053'),
  ('SYSCFG_COMP', 'System configuration controller and
      Comparator', 0x40010000, 0x0, 0x400, 'STM32L053'),
  ('SPI1', 'Serial peripheral interface', 0x40013000, 0x0, 0x400, 'STM32L053'),
  ('SPI2', 'Serial peripheral interface', 0x40003800, 0x0, 0x400, 'STM32L053'),
  ('I2C1', 'Inter-integrated circuit', 0x40005400, 0x0, 0x400, 'STM32L053'),
  ('I2C2', 'Inter-integrated circuit', 0x40005800, 0x0, 0x400, 'STM32L053'),
  ('I2C3', 'Inter-integrated circuit', 0x40007800, 0x0, 0x400, 'STM32L053'),
  ('PWR', 'Power control', 0x40007000, 0x0, 0x400, 'STM32L053'),
  ('Flash', 'Flash', 0x40022000, 0x0, 0x400, 'STM32L053'),
  ('EXTI', 'External interrupt/event
      controller', 0x40010400, 0x0, 0x400, 'STM32L053'),
  ('ADC', 'Analog-to-digital converter', 0x40012400, 0x0, 0x400, 'STM32L053'),
  ('DBGMCU', 'Debug support', 0x40015800, 0x0, 0x400, 'STM32L053'),
  ('TIM2', 'General-purpose-timers', 0x40000000, 0x0, 0x400, 'STM32L053'),
  ('TIM3', 'General-purpose-timers', 0x40000400, 0x0, 0x400, 'STM32L053'),
  ('TIM6', 'Basic-timers', 0x40001000, 0x0, 0x400, 'STM32L053'),
  ('TIM7', 'Basic-timers', 0x40001400, 0x0, 0x400, 'STM32L053'),
  ('TIM21', 'General-purpose-timers', 0x40010800, 0x0, 0x400, 'STM32L053'),
  ('TIM22', 'General-purpose-timers', 0x40011400, 0x0, 0x400, 'STM32L053'),
  ('LPUSART1', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004800, 0x0, 0x400, 'STM32L053'),
  ('NVIC', 'Nested Vectored Interrupt
      Controller', 0xE000E100, 0x0, 0x33D, 'STM32L053'),
  ('USB_SRAM', 'Universal serial bus full-speed device
      interface', 0x40006000, 0x0, 0x800, 'STM32L053'),
  ('LCD', 'Liquid crystal display controller', 0x40002400, 0x0, 0x400, 'STM32L053'),
  ('MPU', 'Memory protection unit', 0xE000ED90, 0x0, 0x15, 'STM32L053'),
  ('STK', 'SysTick timer', 0xE000E010, 0x0, 0x11, 'STM32L053'),
  ('SCB', 'System control block', 0xE000ED00, 0x0, 0x41, 'STM32L053');

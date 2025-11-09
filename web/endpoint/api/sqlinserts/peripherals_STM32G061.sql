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
  ('AES', 'AES register block', 0x40026000, 0x0, 0x400, 'STM32G061'),
  ('ADC', 'ADC address block description', 0x40012400, 0x0, 0x400, 'STM32G061'),
  ('CRC', 'Cyclic redundancy check calculation
      unit', 0x40023000, 0x0, 0x400, 'STM32G061'),
  ('DAC', 'DAC', 0x40007400, 0x0, 0x400, 'STM32G061'),
  ('DBG', 'Debug support', 0x40015800, 0x0, 0x400, 'STM32G061'),
  ('DMA1', 'DMA controller', 0x40020000, 0x0, 0x400, 'STM32G061'),
  ('DMA2', 'DMA controller', 0x40020400, 0x0, 0x400, 'STM32G061'),
  ('DMAMUX', 'DMAMUX', 0x40020800, 0x0, 0x800, 'STM32G061'),
  ('EXTI', 'External interrupt/event
      controller', 0x40021800, 0x0, 0x400, 'STM32G061'),
  ('FLASH', 'Flash', 0x40022000, 0x0, 0x400, 'STM32G061'),
  ('GPIOA', 'General-purpose I/Os', 0x50000000, 0x0, 0x400, 'STM32G061'),
  ('GPIOB', 'General-purpose I/Os', 0x50000400, 0x0, 0x400, 'STM32G061'),
  ('GPIOC', 'General-purpose I/Os', 0x50000800, 0x0, 0x400, 'STM32G061'),
  ('GPIOD', 'General-purpose I/Os', 0x50000C00, 0x0, 0x400, 'STM32G061'),
  ('GPIOE', 'General-purpose I/Os', 0x50001000, 0x0, 0x400, 'STM32G061'),
  ('GPIOF', 'General-purpose I/Os', 0x50001400, 0x0, 0x400, 'STM32G061'),
  ('HDMI_CEC', 'HDMI-CEC', 0x40007800, 0x0, 0x400, 'STM32G061'),
  ('I2C1', 'Inter-integrated circuit', 0x40005400, 0x0, 0x400, 'STM32G061'),
  ('I2C2', 'Inter-integrated circuit', 0x40005800, 0x0, 0x400, 'STM32G061'),
  ('IWDG', 'Independent watchdog', 0x40003000, 0x0, 0x400, 'STM32G061'),
  ('LPTIM1', 'Low power timer', 0x40007C00, 0x0, 0x400, 'STM32G061'),
  ('LPTIM2', 'Low power timer', 0x40009400, 0x0, 0x400, 'STM32G061'),
  ('LPUART1', 'Low-power universal asynchronous receiver transmitter', 0x40008000, 0x0, 0x400, 'STM32G061'),
  ('PWR', 'Power control', 0x40007000, 0x0, 0x400, 'STM32G061'),
  ('RCC', 'Reset and clock control', 0x40021000, 0x0, 0x400, 'STM32G061'),
  ('RNG', 'Random number generator', 0x40025000, 0x0, 0x400, 'STM32G061'),
  ('RTC', 'Real-time clock', 0x40002800, 0x0, 0x400, 'STM32G061'),
  ('SYSCFG', 'System configuration controller', 0x40010000, 0x0, 0x100, 'STM32G061'),
  ('TAMP', 'Tamper and backup registers', 0x4000B000, 0x0, 0x400, 'STM32G061'),
  ('TIM1', 'Advanced-timers', 0x40012C00, 0x0, 0x400, 'STM32G061'),
  ('TIM2', 'General-purpose-timers', 0x40000000, 0x0, 0x400, 'STM32G061'),
  ('TIM3', 'General-purpose-timers', 0x40000400, 0x0, 0x400, 'STM32G061'),
  ('TIM6', 'Basic timers', 0x40001000, 0x0, 0x400, 'STM32G061'),
  ('TIM7', 'Basic timers', 0x40001400, 0x0, 0x400, 'STM32G061'),
  ('TIM14', 'General purpose timers', 0x40002000, 0x0, 0x400, 'STM32G061'),
  ('TIM15', 'General purpose timers', 0x40014000, 0x0, 0x400, 'STM32G061'),
  ('TIM16', 'General purpose timers', 0x40014400, 0x0, 0x400, 'STM32G061'),
  ('TIM17', 'General purpose timers', 0x40014800, 0x0, 0x400, 'STM32G061'),
  ('USART1', 'Universal synchronous asynchronous receiver
      transmitter', 0x40013800, 0x0, 0x400, 'STM32G061'),
  ('USART2', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004400, 0x0, 0x400, 'STM32G061'),
  ('VREFBUF', 'System configuration controller', 0x40010030, 0x0, 0x400, 'STM32G061'),
  ('WWDG', 'System window watchdog', 0x40002C00, 0x0, 0x400, 'STM32G061');

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
  ('GPIOA', 'General-purpose I/Os', 0x48000000, 0x0, 0x400, 'STM32F373'),
  ('GPIOB', 'General-purpose I/Os', 0x48000400, 0x0, 0x400, 'STM32F373'),
  ('GPIOD', 'General-purpose I/Os', 0x48000C00, 0x0, 0x400, 'STM32F373'),
  ('GPIOC', 'General-purpose I/Os', 0x48000800, 0x0, 0x400, 'STM32F373'),
  ('GPIOE', 'General-purpose I/Os', 0x48001000, 0x0, 0x400, 'STM32F373'),
  ('GPIOF', 'General-purpose I/Os', 0x48001400, 0x0, 0x400, 'STM32F373'),
  ('TSC', 'Touch sensing controller', 0x40024000, 0x0, 0x400, 'STM32F373'),
  ('CRC', 'cyclic redundancy check calculation
      unit', 0x40023000, 0x0, 0x400, 'STM32F373'),
  ('Flash', 'Flash', 0x40022000, 0x0, 0x400, 'STM32F373'),
  ('RCC', 'Reset and clock control', 0x40021000, 0x0, 0x400, 'STM32F373'),
  ('DMA1', 'DMA controller 1', 0x40020000, 0x0, 0x400, 'STM32F373'),
  ('DMA2', 'DMA controller 1', 0x40020400, 0x0, 0x400, 'STM32F373'),
  ('TIM2', 'General purpose timer', 0x40000000, 0x0, 0x400, 'STM32F373'),
  ('TIM5', 'General purpose timer', 0x40000C00, 0x0, 0x400, 'STM32F373'),
  ('TIM3', 'General purpose timer', 0x40000400, 0x0, 0x400, 'STM32F373'),
  ('TIM4', 'General purpose timer', 0x40000800, 0x0, 0x400, 'STM32F373'),
  ('TIM19', 'General purpose timer', 0x40015C00, 0x0, 0x400, 'STM32F373'),
  ('TIM15', 'General purpose timers', 0x40014000, 0x0, 0x400, 'STM32F373'),
  ('TIM16', 'General-purpose-timers', 0x40014400, 0x0, 0x400, 'STM32F373'),
  ('TIM17', 'General-purpose-timers', 0x40014800, 0x0, 0x400, 'STM32F373'),
  ('USART1', 'Universal synchronous asynchronous receiver
      transmitter', 0x40013800, 0x0, 0x400, 'STM32F373'),
  ('USART2', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004400, 0x0, 0x400, 'STM32F373'),
  ('USART3', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004800, 0x0, 0x400, 'STM32F373'),
  ('SPI1', 'Serial peripheral interface/Inter-IC
      sound', 0x40013000, 0x0, 0x400, 'STM32F373'),
  ('SPI2', 'Serial peripheral interface/Inter-IC
      sound', 0x40003800, 0x0, 0x400, 'STM32F373'),
  ('SPI3', 'Serial peripheral interface/Inter-IC
      sound', 0x40003C00, 0x0, 0x400, 'STM32F373'),
  ('I2S2ext', 'Serial peripheral interface/Inter-IC
      sound', 0x40003400, 0x0, 0x400, 'STM32F373'),
  ('I2S3ext', 'Serial peripheral interface/Inter-IC
      sound', 0x40004000, 0x0, 0x400, 'STM32F373'),
  ('ADC', 'Analog to digital converter', 0x40012400, 0x0, 0x400, 'STM32F373'),
  ('EXTI', 'External interrupt/event
      controller', 0x40010400, 0x0, 0x400, 'STM32F373'),
  ('CEC', 'HDMI-CEC controller', 0x40007800, 0x0, 0x400, 'STM32F373'),
  ('PWR', 'Power control', 0x40007000, 0x0, 0x400, 'STM32F373'),
  ('CAN', 'Controller area network', 0x40006400, 0x0, 0x400, 'STM32F373'),
  ('USB', 'Universal serial bus full-speed device
      interface', 0x40005C00, 0x0, 0x400, 'STM32F373'),
  ('I2C1', 'Inter-integrated circuit', 0x40005400, 0x0, 0x400, 'STM32F373'),
  ('I2C2', 'Inter-integrated circuit', 0x40005800, 0x0, 0x400, 'STM32F373'),
  ('IWDG', 'Independent watchdog', 0x40003000, 0x0, 0x400, 'STM32F373'),
  ('WWDG', 'Window watchdog', 0x40002C00, 0x0, 0x400, 'STM32F373'),
  ('RTC', 'Real-time clock', 0x40002800, 0x0, 0x400, 'STM32F373'),
  ('SDADC1', 'Sigma-delta analog-to-digital
      converter', 0x40016000, 0x0, 0x400, 'STM32F373'),
  ('SDADC2', 'Sigma-delta analog-to-digital
      converter', 0x40016400, 0x0, 0x400, 'STM32F373'),
  ('SDADC3', 'Sigma-delta analog-to-digital
      converter', 0x40016800, 0x0, 0x400, 'STM32F373'),
  ('DAC2', 'Digital-to-analog converter', 0x40009800, 0x0, 0x400, 'STM32F373'),
  ('TIM6', 'Basic timers', 0x40001000, 0x0, 0x400, 'STM32F373'),
  ('TIM7', 'Basic timers', 0x40001400, 0x0, 0x400, 'STM32F373'),
  ('TIM18', 'Basic timers', 0x40009C00, 0x0, 0x400, 'STM32F373'),
  ('TIM13', 'General purpose timers', 0x40001C00, 0x0, 0x400, 'STM32F373'),
  ('TIM14', 'General purpose timers', 0x40002000, 0x0, 0x400, 'STM32F373'),
  ('TIM12', 'General purpose timers', 0x40001800, 0x0, 0x400, 'STM32F373'),
  ('DAC1', 'Digital-to-analog converter', 0x40007400, 0x0, 0x400, 'STM32F373'),
  ('DBGMCU', 'Debug support', 0xE0042000, 0x0, 0x400, 'STM32F373'),
  ('SYSCFG_COMP_OPAMP', 'System configuration controller', 0x40010000, 0x0, 0x400, 'STM32F373');

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
  ('GPIOA', 'General-purpose I/Os', 0x48000000, 0x0, 0x400, 'STM32F3x8'),
  ('GPIOH', 'General-purpose I/Os', 0x48001C00, 0x0, 0x400, 'STM32F3x8'),
  ('GPIOB', 'General-purpose I/Os', 0x48000400, 0x0, 0x400, 'STM32F3x8'),
  ('GPIOD', 'General-purpose I/Os', 0x48000C00, 0x0, 0x400, 'STM32F3x8'),
  ('GPIOC', 'General-purpose I/Os', 0x48000800, 0x0, 0x400, 'STM32F3x8'),
  ('GPIOE', 'General-purpose I/Os', 0x48001000, 0x0, 0x400, 'STM32F3x8'),
  ('GPIOF', 'General-purpose I/Os', 0x48001400, 0x0, 0x400, 'STM32F3x8'),
  ('GPIOG', 'General-purpose I/Os', 0x48001800, 0x0, 0x400, 'STM32F3x8'),
  ('TSC', 'Touch sensing controller', 0x40024000, 0x0, 0x400, 'STM32F3x8'),
  ('CRC', 'cyclic redundancy check calculation
      unit', 0x40023000, 0x0, 0x400, 'STM32F3x8'),
  ('Flash', 'Flash', 0x40022000, 0x0, 0x400, 'STM32F3x8'),
  ('RCC', 'Reset and clock control', 0x40021000, 0x0, 0x400, 'STM32F3x8'),
  ('DMA1', 'DMA controller 1', 0x40020000, 0x0, 0x400, 'STM32F3x8'),
  ('DMA2', 'DMA controller 1', 0x40020400, 0x0, 0x400, 'STM32F3x8'),
  ('TIM2', 'General purpose timer', 0x40000000, 0x0, 0x400, 'STM32F3x8'),
  ('TIM5', 'General purpose timer', 0x40000C00, 0x0, 0x400, 'STM32F3x8'),
  ('TIM3', 'General purpose timer', 0x40000400, 0x0, 0x400, 'STM32F3x8'),
  ('TIM4', 'General purpose timer', 0x40000800, 0x0, 0x400, 'STM32F3x8'),
  ('TIM19', 'General purpose timer', 0x40015C00, 0x0, 0x400, 'STM32F3x8'),
  ('TIM15', 'General purpose timers', 0x40014000, 0x0, 0x400, 'STM32F3x8'),
  ('TIM16', 'General-purpose-timers', 0x40014400, 0x0, 0x400, 'STM32F3x8'),
  ('TIM17', 'General-purpose-timers', 0x40014800, 0x0, 0x400, 'STM32F3x8'),
  ('TIM20', 'General-purpose-timers', 0x40015000, 0x0, 0x400, 'STM32F3x8'),
  ('USART1', 'Universal synchronous asynchronous receiver
      transmitter', 0x40013800, 0x0, 0x400, 'STM32F3x8'),
  ('USART2', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004400, 0x0, 0x400, 'STM32F3x8'),
  ('USART3', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004800, 0x0, 0x400, 'STM32F3x8'),
  ('UART4', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004C00, 0x0, 0x400, 'STM32F3x8'),
  ('UART5', 'Universal synchronous asynchronous receiver
      transmitter', 0x40005000, 0x0, 0x400, 'STM32F3x8'),
  ('SPI1', 'Serial peripheral interface/Inter-IC
      sound', 0x40013000, 0x0, 0x400, 'STM32F3x8'),
  ('SPI2', 'Serial peripheral interface/Inter-IC
      sound', 0x40003800, 0x0, 0x400, 'STM32F3x8'),
  ('SPI3', 'Serial peripheral interface/Inter-IC
      sound', 0x40003C00, 0x0, 0x400, 'STM32F3x8'),
  ('I2S2ext', 'Serial peripheral interface/Inter-IC
      sound', 0x40003400, 0x0, 0x400, 'STM32F3x8'),
  ('I2S3ext', 'Serial peripheral interface/Inter-IC
      sound', 0x40004000, 0x0, 0x400, 'STM32F3x8'),
  ('SPI4', 'Serial peripheral interface/Inter-IC
      sound', 0x40013C00, 0x0, 0x400, 'STM32F3x8'),
  ('ADC1', 'Analog-to-Digital Converter', 0x50000000, 0x0, 0x100, 'STM32F3x8'),
  ('ADC2', 'Analog-to-Digital Converter', 0x50000100, 0x0, 0x100, 'STM32F3x8'),
  ('ADC3', 'Analog-to-Digital Converter', 0x50000400, 0x0, 0x100, 'STM32F3x8'),
  ('ADC4', 'Analog-to-Digital Converter', 0x50000500, 0x0, 0x100, 'STM32F3x8'),
  ('ADC1_2', 'Analog-to-Digital Converter', 0x50000300, 0x0, 0x10, 'STM32F3x8'),
  ('ADC3_4', 'Analog-to-Digital Converter', 0x50000700, 0x0, 0x10, 'STM32F3x8'),
  ('EXTI', 'External interrupt/event
      controller', 0x40010400, 0x0, 0x400, 'STM32F3x8'),
  ('PWR', 'Power control', 0x40007000, 0x0, 0x400, 'STM32F3x8'),
  ('CAN', 'Controller area network', 0x40006400, 0x0, 0x400, 'STM32F3x8'),
  ('USB', 'Universal serial bus full-speed device
      interface', 0x40005C00, 0x0, 0x400, 'STM32F3x8'),
  ('I2C1', 'Inter-integrated circuit', 0x40005400, 0x0, 0x400, 'STM32F3x8'),
  ('I2C2', 'Inter-integrated circuit', 0x40005800, 0x0, 0x400, 'STM32F3x8'),
  ('I2C3', 'Inter-integrated circuit', 0x40007800, 0x0, 0x400, 'STM32F3x8'),
  ('IWDG', 'Independent watchdog', 0x40003000, 0x0, 0x400, 'STM32F3x8'),
  ('WWDG', 'Window watchdog', 0x40002C00, 0x0, 0x400, 'STM32F3x8'),
  ('RTC', 'Real-time clock', 0x40002800, 0x0, 0x400, 'STM32F3x8'),
  ('DAC2', 'Digital-to-analog converter', 0x40009800, 0x0, 0x400, 'STM32F3x8'),
  ('TIM6', 'Basic timers', 0x40001000, 0x0, 0x400, 'STM32F3x8'),
  ('TIM7', 'Basic timers', 0x40001400, 0x0, 0x400, 'STM32F3x8'),
  ('TIM18', 'Basic timers', 0x40009C00, 0x0, 0x400, 'STM32F3x8'),
  ('TIM13', 'General purpose timers', 0x40001C00, 0x0, 0x400, 'STM32F3x8'),
  ('TIM14', 'General purpose timers', 0x40002000, 0x0, 0x400, 'STM32F3x8'),
  ('TIM12', 'General purpose timers', 0x40001800, 0x0, 0x400, 'STM32F3x8'),
  ('DAC1', 'Digital-to-analog converter', 0x40007400, 0x0, 0x400, 'STM32F3x8'),
  ('DBGMCU', 'Debug support', 0xE0042000, 0x0, 0x400, 'STM32F3x8'),
  ('FMC', 'Flexible memory controller', 0xA0000400, 0x0, 0xC00, 'STM32F3x8'),
  ('TIM1', 'Advanced timer', 0x40012C00, 0x0, 0x400, 'STM32F3x8'),
  ('TIM8', 'Advanced timer', 0x40013400, 0x0, 0x400, 'STM32F3x8'),
  ('SYSCFG_COMP_OPAMP', 'System configuration controller', 0x40010000, 0x0, 0x400, 'STM32F3x8');

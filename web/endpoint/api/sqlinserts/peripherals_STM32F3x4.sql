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
  ('GPIOA', 'General-purpose I/Os', 0x48000000, 0x0, 0x400, 'STM32F3x4'),
  ('GPIOB', 'General-purpose I/Os', 0x48000400, 0x0, 0x400, 'STM32F3x4'),
  ('GPIOC', 'General-purpose I/Os', 0x48000800, 0x0, 0x400, 'STM32F3x4'),
  ('GPIOD', 'General-purpose I/Os', 0x48000C00, 0x0, 0x400, 'STM32F3x4'),
  ('GPIOF', 'General-purpose I/Os', 0x48001400, 0x0, 0x400, 'STM32F3x4'),
  ('TSC', 'Touch sensing controller', 0x40024000, 0x0, 0x400, 'STM32F3x4'),
  ('CRC', 'cyclic redundancy check calculation
      unit', 0x40023000, 0x0, 0x400, 'STM32F3x4'),
  ('Flash', 'Flash', 0x40022000, 0x0, 0x400, 'STM32F3x4'),
  ('RCC', 'Reset and clock control', 0x40021000, 0x0, 0x400, 'STM32F3x4'),
  ('DMA1', 'DMA controller 1', 0x40020000, 0x0, 0x400, 'STM32F3x4'),
  ('TIM2', 'General purpose timer', 0x40000000, 0x0, 0x400, 'STM32F3x4'),
  ('TIM15', 'General purpose timers', 0x40014000, 0x0, 0x400, 'STM32F3x4'),
  ('TIM16', 'General-purpose-timers', 0x40014400, 0x0, 0x400, 'STM32F3x4'),
  ('TIM17', 'General purpose timer', 0x40014800, 0x0, 0x400, 'STM32F3x4'),
  ('USART1', 'Universal synchronous asynchronous
      receiver-transmitter', 0x40013800, 0x0, 0x400, 'STM32F3x4'),
  ('USART2', 'Universal synchronous asynchronous
      receiver-transmitter', 0x40004400, 0x0, 0x400, 'STM32F3x4'),
  ('USART3', 'Universal synchronous asynchronous
      receiver-transmitter', 0x40004800, 0x0, 0x400, 'STM32F3x4'),
  ('SPI2', 'Serial peripheral
      interface/Inter-IC2', 0x40003800, 0x0, 0x400, 'STM32F3x4'),
  ('I2S2ext', 'Serial peripheral
      interface/Inter-IC2', 0x40003400, 0x0, 0x400, 'STM32F3x4'),
  ('I2S3ext', 'Serial peripheral
      interface/Inter-IC2', 0x40004000, 0x0, 0x400, 'STM32F3x4'),
  ('SPI3', 'Serial peripheral
      interface/Inter-IC2', 0x40003C00, 0x0, 0x400, 'STM32F3x4'),
  ('SPI1', 'Serial peripheral
      interface/Inter-IC2', 0x40013000, 0x0, 0x400, 'STM32F3x4'),
  ('EXTI', 'External interrupt/event
      controller', 0x40010400, 0x0, 0x400, 'STM32F3x4'),
  ('PWR', 'Power control', 0x40007000, 0x0, 0x400, 'STM32F3x4'),
  ('I2C1', 'Inter-integrated circuit', 0x40005400, 0x0, 0x400, 'STM32F3x4'),
  ('I2C2', 'Inter-integrated circuit', 0x40005800, 0x0, 0x400, 'STM32F3x4'),
  ('I2C3', 'Inter-integrated circuit', 0x40007800, 0x0, 0x400, 'STM32F3x4'),
  ('IWDG', 'Independent watchdog', 0x40003000, 0x0, 0x400, 'STM32F3x4'),
  ('WWDG', 'Window watchdog', 0x40002C00, 0x0, 0x400, 'STM32F3x4'),
  ('RTC', 'Real-time clock', 0x40002800, 0x0, 0x400, 'STM32F3x4'),
  ('TIM6', 'Basic timers', 0x40001000, 0x0, 0x400, 'STM32F3x4'),
  ('TIM7', 'Basic timers', 0x40001400, 0x0, 0x400, 'STM32F3x4'),
  ('DAC1', 'Digital-to-analog converter', 0x40007400, 0x0, 0x400, 'STM32F3x4'),
  ('DAC2', 'Digital-to-analog converter', 0x40009800, 0x0, 0x400, 'STM32F3x4'),
  ('DBGMCU', 'Debug support', 0xE0042000, 0x0, 0x400, 'STM32F3x4'),
  ('TIM1', 'Advanced timer', 0x40012C00, 0x0, 0x400, 'STM32F3x4'),
  ('ADC1', 'Analog-to-Digital Converter', 0x50000000, 0x0, 0xB9, 'STM32F3x4'),
  ('ADC2', 'Analog-to-Digital Converter', 0x50000100, 0x0, 0xB9, 'STM32F3x4'),
  ('SYSCFG_COMP_OPAMP', 'System configuration controller', 0x40010000, 0x0, 0x400, 'STM32F3x4'),
  ('TIM3', 'General purpose timer', 0x40000400, 0x0, 0x400, 'STM32F3x4'),
  ('CAN', 'Controller area network', 0x40006400, 0x0, 0x400, 'STM32F3x4'),
  ('ADC_Common', 'ADC common registers', 0x50000300, 0x0, 0x11, 'STM32F3x4'),
  ('HRTIM_Master', 'High Resolution Timer: Master
      Timers', 0x40017400, 0x0, 0x80, 'STM32F3x4'),
  ('HRTIM_TIMA', 'High Resolution Timer: TIMA', 0x40017480, 0x0, 0x80, 'STM32F3x4'),
  ('HRTIM_TIMB', 'High Resolution Timer: TIMB', 0x40017500, 0x0, 0x80, 'STM32F3x4'),
  ('HRTIM_TIMC', 'High Resolution Timer: TIMC', 0x40017580, 0x0, 0x80, 'STM32F3x4'),
  ('HRTIM_TIMD', 'High Resolution Timer: TIMD', 0x40017600, 0x0, 0x80, 'STM32F3x4'),
  ('HRTIM_TIME', 'High Resolution Timer: TIME', 0x40017680, 0x0, 0x80, 'STM32F3x4'),
  ('HRTIM_Common', 'High Resolution Timer: Common
      functions', 0x40017780, 0x0, 0x80, 'STM32F3x4');

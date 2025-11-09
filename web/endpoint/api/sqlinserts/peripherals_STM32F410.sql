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
  ('ADC_Common', 'ADC common registers', 0x40012300, 0x0, 0x9, 'STM32F410'),
  ('ADC1', 'Analog-to-digital converter', 0x40012000, 0x0, 0x51, 'STM32F410'),
  ('CRC', 'Cryptographic processor', 0x40023000, 0x0, 0x400, 'STM32F410'),
  ('DBG', 'Debug support', 0xE0042000, 0x0, 0x400, 'STM32F410'),
  ('EXTI', 'External interrupt/event
      controller', 0x40013C00, 0x0, 0x400, 'STM32F410'),
  ('FLASH', 'FLASH', 0x40023C00, 0x0, 0x400, 'STM32F410'),
  ('IWDG', 'Independent watchdog', 0x40003000, 0x0, 0x400, 'STM32F410'),
  ('PWR', 'Power control', 0x40007000, 0x0, 0x400, 'STM32F410'),
  ('RCC', 'Reset and clock control', 0x40023800, 0x0, 0x400, 'STM32F410'),
  ('RTC', 'Real-time clock', 0x40002800, 0x0, 0x400, 'STM32F410'),
  ('SYSCFG', 'System configuration controller', 0x40013800, 0x0, 0x400, 'STM32F410'),
  ('TIM1', 'Advanced-timers', 0x40010000, 0x0, 0x400, 'STM32F410'),
  ('TIM8', 'Advanced-timers', 0x40010400, 0x0, 0x400, 'STM32F410'),
  ('TIM11', 'General-purpose-timers', 0x40014800, 0x0, 0x400, 'STM32F410'),
  ('TIM5', 'General-purpose-timers', 0x40000C00, 0x0, 0x400, 'STM32F410'),
  ('TIM9', 'General purpose timers', 0x40014000, 0x0, 0x400, 'STM32F410'),
  ('USART1', 'Universal synchronous asynchronous receiver
      transmitter', 0x40011000, 0x0, 0x400, 'STM32F410'),
  ('USART2', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004400, 0x0, 0x400, 'STM32F410'),
  ('USART6', 'Universal synchronous asynchronous receiver
      transmitter', 0x40011400, 0x0, 0x400, 'STM32F410'),
  ('WWDG', 'Window watchdog', 0x40002C00, 0x0, 0x400, 'STM32F410'),
  ('DMA2', 'DMA controller', 0x40026400, 0x0, 0x400, 'STM32F410'),
  ('DMA1', 'DMA controller', 0x40026000, 0x0, 0x400, 'STM32F410'),
  ('GPIOH', 'General-purpose I/Os', 0x40021C00, 0x0, 0x400, 'STM32F410'),
  ('GPIOC', 'General-purpose I/Os', 0x40020800, 0x0, 0x400, 'STM32F410'),
  ('GPIOB', 'General-purpose I/Os', 0x40020400, 0x0, 0x400, 'STM32F410'),
  ('GPIOA', 'General-purpose I/Os', 0x40020000, 0x0, 0x400, 'STM32F410'),
  ('I2C2', 'Inter-integrated circuit', 0x40005800, 0x0, 0x400, 'STM32F410'),
  ('I2C1', 'Inter-integrated circuit', 0x40005400, 0x0, 0x400, 'STM32F410'),
  ('SPI1', 'Serial peripheral interface', 0x40013000, 0x0, 0x400, 'STM32F410'),
  ('SPI2', 'Serial peripheral interface', 0x40003800, 0x0, 0x400, 'STM32F410'),
  ('SPI5', 'Serial peripheral interface', 0x40015000, 0x0, 0x400, 'STM32F410'),
  ('TIM6', 'Basic timers', 0x40001000, 0x0, 0x400, 'STM32F410'),
  ('RNG', 'Random number generator', 0x40080000, 0x0, 0x400, 'STM32F410'),
  ('DAC', 'Digital-to-analog converter', 0x40007400, 0x0, 0x400, 'STM32F410'),
  ('LPTIM1', 'Low power timer', 0x40002400, 0x0, 0x400, 'STM32F410'),
  ('I2C4', 'Inter-integrated circuit', 0x40006000, 0x0, 0x400, 'STM32F410');

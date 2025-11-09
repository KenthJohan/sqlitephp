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
  ('CRC', 'cyclic redundancy check calculation
      unit', 0x40023000, 0x0, 0x400, 'STM32F0x8'),
  ('GPIOF', 'General-purpose I/Os', 0x48001400, 0x0, 0x400, 'STM32F0x8'),
  ('GPIOD', 'General-purpose I/Os', 0x48000C00, 0x0, 0x400, 'STM32F0x8'),
  ('GPIOC', 'General-purpose I/Os', 0x48000800, 0x0, 0x400, 'STM32F0x8'),
  ('GPIOB', 'General-purpose I/Os', 0x48000400, 0x0, 0x400, 'STM32F0x8'),
  ('GPIOE', 'General-purpose I/Os', 0x48001000, 0x0, 0x400, 'STM32F0x8'),
  ('GPIOA', 'General-purpose I/Os', 0x48000000, 0x0, 0x400, 'STM32F0x8'),
  ('SPI1', 'Serial peripheral interface', 0x40013000, 0x0, 0x400, 'STM32F0x8'),
  ('SPI2', 'Serial peripheral interface', 0x40003800, 0x0, 0x400, 'STM32F0x8'),
  ('PWR', 'Power control', 0x40007000, 0x0, 0x400, 'STM32F0x8'),
  ('I2C1', 'Inter-integrated circuit', 0x40005400, 0x0, 0x400, 'STM32F0x8'),
  ('I2C2', 'Inter-integrated circuit', 0x40005800, 0x0, 0x400, 'STM32F0x8'),
  ('IWDG', 'Independent watchdog', 0x40003000, 0x0, 0x400, 'STM32F0x8'),
  ('WWDG', 'Window watchdog', 0x40002C00, 0x0, 0x400, 'STM32F0x8'),
  ('TIM1', 'Advanced-timers', 0x40012C00, 0x0, 0x400, 'STM32F0x8'),
  ('TIM2', 'General-purpose-timers', 0x40000000, 0x0, 0x400, 'STM32F0x8'),
  ('TIM3', 'General-purpose-timers', 0x40000400, 0x0, 0x400, 'STM32F0x8'),
  ('TIM14', 'General-purpose-timers', 0x40002000, 0x0, 0x400, 'STM32F0x8'),
  ('TIM6', 'Basic-timers', 0x40001000, 0x0, 0x400, 'STM32F0x8'),
  ('TIM7', 'Basic-timers', 0x40001400, 0x0, 0x400, 'STM32F0x8'),
  ('EXTI', 'External interrupt/event
      controller', 0x40010400, 0x0, 0x400, 'STM32F0x8'),
  ('NVIC', 'Nested Vectored Interrupt
      Controller', 0xE000E100, 0x0, 0x33D, 'STM32F0x8'),
  ('DMA1', 'DMA controller', 0x40020000, 0x0, 0x400, 'STM32F0x8'),
  ('DMA2', 'DMA controller', 0x40020400, 0x0, 0x400, 'STM32F0x8'),
  ('RCC', 'Reset and clock control', 0x40021000, 0x0, 0x400, 'STM32F0x8'),
  ('SYSCFG_COMP', 'System configuration controller', 0x40010000, 0x0, 0x21, 'STM32F0x8'),
  ('ADC', 'Analog-to-digital converter', 0x40012400, 0x0, 0x400, 'STM32F0x8'),
  ('USART1', 'Universal synchronous asynchronous receiver
      transmitter', 0x40013800, 0x0, 0x400, 'STM32F0x8'),
  ('USART2', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004400, 0x0, 0x400, 'STM32F0x8'),
  ('USART3', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004800, 0x0, 0x400, 'STM32F0x8'),
  ('USART4', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004C00, 0x0, 0x400, 'STM32F0x8'),
  ('USART6', 'Universal synchronous asynchronous receiver
      transmitter', 0x40011400, 0x0, 0x400, 'STM32F0x8'),
  ('USART7', 'Universal synchronous asynchronous receiver
      transmitter', 0x40011800, 0x0, 0x400, 'STM32F0x8'),
  ('USART8', 'Universal synchronous asynchronous receiver
      transmitter', 0x40011C00, 0x0, 0x400, 'STM32F0x8'),
  ('USART5', 'Universal synchronous asynchronous receiver
      transmitter', 0x40005000, 0x0, 0x400, 'STM32F0x8'),
  ('RTC', 'Real-time clock', 0x40002800, 0x0, 0x400, 'STM32F0x8'),
  ('TIM15', 'General-purpose-timers', 0x40014000, 0x0, 0x400, 'STM32F0x8'),
  ('TIM16', 'General-purpose-timers', 0x40014400, 0x0, 0x400, 'STM32F0x8'),
  ('TIM17', 'General-purpose-timers', 0x40014800, 0x0, 0x400, 'STM32F0x8'),
  ('TSC', 'Touch sensing controller', 0x40024000, 0x0, 0x400, 'STM32F0x8'),
  ('CEC', 'HDMI-CEC controller', 0x40007800, 0x0, 0x400, 'STM32F0x8'),
  ('Flash', 'Flash', 0x40022000, 0x0, 0x400, 'STM32F0x8'),
  ('DBGMCU', 'Debug support', 0x40015800, 0x0, 0x400, 'STM32F0x8'),
  ('USB', 'Universal serial bus full-speed device
      interface', 0x40005C00, 0x0, 0x400, 'STM32F0x8'),
  ('CRS', 'Clock recovery system', 0x40006C00, 0x0, 0x400, 'STM32F0x8'),
  ('CAN', 'Controller area network', 0x40006400, 0x0, 0x400, 'STM32F0x8'),
  ('DAC', 'Digital-to-analog converter', 0x40007400, 0x0, 0x400, 'STM32F0x8'),
  ('SCB', 'System control block', 0xE000ED00, 0x0, 0x41, 'STM32F0x8'),
  ('STK', 'SysTick timer', 0xE000E010, 0x0, 0x11, 'STM32F0x8');

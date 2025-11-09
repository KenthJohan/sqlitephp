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
  ('ADC', 'Analog to Digital Converter', 0x40012400, 0x0, 0x400, 'STM32G0B1'),
  ('COMP', 'Comparator', 0x40010200, 0x0, 0x400, 'STM32G0B1'),
  ('CRC', 'Cyclic redundancy check calculation
      unit', 0x40023000, 0x0, 0x400, 'STM32G0B1'),
  ('DAC', 'DAC', 0x40007400, 0x0, 0x400, 'STM32G0B1'),
  ('DBG', 'Debug support', 0x40015800, 0x0, 0x400, 'STM32G0B1'),
  ('DMAMUX', 'DMAMUX', 0x40020800, 0x0, 0x800, 'STM32G0B1'),
  ('DMA1', 'Direct memory access controller', 0x40020000, 0x0, 0x400, 'STM32G0B1'),
  ('DMA2', 'Direct memory access controller', 0x40020400, 0x0, 0x400, 'STM32G0B1'),
  ('EXTI', 'External interrupt/event
      controller', 0x40021800, 0x0, 0x400, 'STM32G0B1'),
  ('FDCAN1', 'FD controller area network', 0x40006400, 0x0, 0x400, 'STM32G0B1'),
  ('FDCAN2', 'FD controller area network', 0x40006800, 0x0, 0x400, 'STM32G0B1'),
  ('FLASH', 'Flash', 0x40022000, 0x0, 0x400, 'STM32G0B1'),
  ('GPIOA', 'General-purpose I/Os', 0x50000000, 0x0, 0x400, 'STM32G0B1'),
  ('GPIOB', 'General-purpose I/Os', 0x50000400, 0x0, 0x400, 'STM32G0B1'),
  ('GPIOC', 'General-purpose I/Os', 0x50000800, 0x0, 0x400, 'STM32G0B1'),
  ('GPIOD', 'General-purpose I/Os', 0x50000C00, 0x0, 0x400, 'STM32G0B1'),
  ('GPIOE', 'General-purpose I/Os', 0x50001000, 0x0, 0x400, 'STM32G0B1'),
  ('GPIOF', 'General-purpose I/Os', 0x50001400, 0x0, 0x400, 'STM32G0B1'),
  ('HDMI_CEC', 'HDMI-CEC', 0x40007800, 0x0, 0x400, 'STM32G0B1'),
  ('I2C1', 'Inter-integrated circuit', 0x40005400, 0x0, 0x400, 'STM32G0B1'),
  ('I2C2', 'Inter-integrated circuit', 0x40005800, 0x0, 0x400, 'STM32G0B1'),
  ('I2C3', 'Inter-integrated circuit', 0x40008800, 0x0, 0x400, 'STM32G0B1'),
  ('IWDG', 'Independent watchdog', 0x40003000, 0x0, 0x400, 'STM32G0B1'),
  ('LPTIM1', 'Low power timer', 0x40007C00, 0x0, 0x400, 'STM32G0B1'),
  ('LPTIM2', 'Low power timer', 0x40009400, 0x0, 0x400, 'STM32G0B1'),
  ('LPUART1', 'Low-power universal asynchronous receiver transmitter', 0x40008000, 0x0, 0x400, 'STM32G0B1'),
  ('LPUART2', 'Low-power universal asynchronous receiver transmitter', 0x40008400, 0x0, 0x400, 'STM32G0B1'),
  ('PWR', 'Power control', 0x40007000, 0x0, 0x400, 'STM32G0B1'),
  ('RCC', 'Reset and clock control', 0x40021000, 0x0, 0x400, 'STM32G0B1'),
  ('RTC', 'Real-time clock', 0x40002800, 0x0, 0x400, 'STM32G0B1'),
  ('SPI1', 'Serial peripheral interface', 0x40013000, 0x0, 0x400, 'STM32G0B1'),
  ('SPI2', 'Serial peripheral interface', 0x40003800, 0x0, 0x400, 'STM32G0B1'),
  ('SPI3', 'Serial peripheral interface', 0x40003C00, 0x0, 0x400, 'STM32G0B1'),
  ('SYSCFG', 'System configuration controller', 0x40010000, 0x0, 0x100, 'STM32G0B1'),
  ('TAMP', 'Tamper and backup registers', 0x4000B000, 0x0, 0x400, 'STM32G0B1'),
  ('TIM1', 'Advanced-timers', 0x40012C00, 0x0, 0x400, 'STM32G0B1'),
  ('TIM2', 'General-purpose-timers', 0x40000000, 0x0, 0x400, 'STM32G0B1'),
  ('TIM3', 'General-purpose-timers', 0x40000400, 0x0, 0x400, 'STM32G0B1'),
  ('TIM4', 'General-purpose-timers', 0x40000800, 0x0, 0x400, 'STM32G0B1'),
  ('TIM6', 'Basic timers', 0x40001000, 0x0, 0x400, 'STM32G0B1'),
  ('TIM7', 'Basic timers', 0x40001400, 0x0, 0x400, 'STM32G0B1'),
  ('TIM14', 'General purpose timers', 0x40002000, 0x0, 0x400, 'STM32G0B1'),
  ('TIM15', 'General purpose timers', 0x40014000, 0x0, 0x400, 'STM32G0B1'),
  ('TIM16', 'General purpose timers', 0x40014400, 0x0, 0x400, 'STM32G0B1'),
  ('TIM17', 'General purpose timers', 0x40014800, 0x0, 0x400, 'STM32G0B1'),
  ('UCPD1', 'USB Power Delivery interface', 0x4000A000, 0x0, 0x400, 'STM32G0B1'),
  ('UCPD2', 'USB Power Delivery interface', 0x4000A400, 0x0, 0x400, 'STM32G0B1'),
  ('USART1', 'Universal synchronous asynchronous receiver
      transmitter', 0x40013800, 0x0, 0x400, 'STM32G0B1'),
  ('USART2', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004400, 0x0, 0x400, 'STM32G0B1'),
  ('USART3', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004800, 0x0, 0x400, 'STM32G0B1'),
  ('USART4', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004C00, 0x0, 0x400, 'STM32G0B1'),
  ('USART5', 'Universal synchronous asynchronous receiver
      transmitter', 0x40005000, 0x0, 0x400, 'STM32G0B1'),
  ('USART6', 'Universal synchronous asynchronous receiver
      transmitter', 0x40013C00, 0x0, 0x400, 'STM32G0B1'),
  ('USB', 'Universal serial bus full-speed host/device interface', 0x40005C00, 0x0, 0x400, 'STM32G0B1'),
  ('VREFBUF', 'System configuration controller', 0x40010030, 0x0, 0x400, 'STM32G0B1'),
  ('WWDG', 'System window watchdog', 0x40002C00, 0x0, 0x400, 'STM32G0B1');

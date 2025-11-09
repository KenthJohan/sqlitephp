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
  ('AES', 'Advanced encryption standard hardware
      accelerator', 0x40026000, 0x0, 0x400, 'STM32L0x1'),
  ('DMA1', 'Direct memory access controller', 0x40020000, 0x0, 0x400, 'STM32L0x1'),
  ('CRC', 'Cyclic redundancy check calculation
      unit', 0x40023000, 0x0, 0x400, 'STM32L0x1'),
  ('GPIOA', 'General-purpose I/Os', 0x50000000, 0x0, 0x400, 'STM32L0x1'),
  ('GPIOB', 'General-purpose I/Os', 0x50000400, 0x0, 0x400, 'STM32L0x1'),
  ('GPIOC', 'General-purpose I/Os', 0x50000800, 0x0, 0x400, 'STM32L0x1'),
  ('GPIOD', 'General-purpose I/Os', 0x50000C00, 0x0, 0x400, 'STM32L0x1'),
  ('GPIOH', 'General-purpose I/Os', 0x50001C00, 0x0, 0x400, 'STM32L0x1'),
  ('GPIOE', 'General-purpose I/Os', 0x50001000, 0x0, 0x400, 'STM32L0x1'),
  ('LPTIM', 'Low power timer', 0x40007C00, 0x0, 0x400, 'STM32L0x1'),
  ('RTC', 'Real-time clock', 0x40002800, 0x0, 0x400, 'STM32L0x1'),
  ('USART1', 'Universal synchronous asynchronous receiver
      transmitter', 0x40013800, 0x0, 0x400, 'STM32L0x1'),
  ('USART2', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004400, 0x0, 0x400, 'STM32L0x1'),
  ('USART4', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004C00, 0x0, 0x400, 'STM32L0x1'),
  ('USART5', 'Universal synchronous asynchronous receiver
      transmitter', 0x40005000, 0x0, 0x400, 'STM32L0x1'),
  ('IWDG', 'Independent watchdog', 0x40003000, 0x0, 0x400, 'STM32L0x1'),
  ('WWDG', 'System window watchdog', 0x40002C00, 0x0, 0x400, 'STM32L0x1'),
  ('Firewall', 'Firewall', 0x40011C00, 0x0, 0x400, 'STM32L0x1'),
  ('RCC', 'Reset and clock control', 0x40021000, 0x0, 0x400, 'STM32L0x1'),
  ('SYSCFG_COMP', 'System configuration controller and COMP
      register', 0x40010000, 0x0, 0x400, 'STM32L0x1'),
  ('SPI1', 'Serial peripheral interface', 0x40013000, 0x0, 0x400, 'STM32L0x1'),
  ('SPI2', 'Serial peripheral interface', 0x40003800, 0x0, 0x400, 'STM32L0x1'),
  ('I2C1', 'Inter-integrated circuit', 0x40005400, 0x0, 0x400, 'STM32L0x1'),
  ('I2C2', 'Inter-integrated circuit', 0x40005800, 0x0, 0x400, 'STM32L0x1'),
  ('I2C3', 'Inter-integrated circuit', 0x40007800, 0x0, 0x400, 'STM32L0x1'),
  ('PWR', 'Power control', 0x40007000, 0x0, 0x400, 'STM32L0x1'),
  ('Flash', 'Flash', 0x40022000, 0x0, 0x400, 'STM32L0x1'),
  ('EXTI', 'External interrupt/event
      controller', 0x40010400, 0x0, 0x400, 'STM32L0x1'),
  ('ADC', 'Analog-to-digital converter', 0x40012400, 0x0, 0x400, 'STM32L0x1'),
  ('DBG', 'Debug support', 0x40015800, 0x0, 0x400, 'STM32L0x1'),
  ('TIM2', 'General-purpose-timers', 0x40000000, 0x0, 0x400, 'STM32L0x1'),
  ('TIM3', 'General-purpose-timers', 0x40000400, 0x0, 0x400, 'STM32L0x1'),
  ('TIM6', 'Basic-timers', 0x40001000, 0x0, 0x400, 'STM32L0x1'),
  ('TIM7', 'Basic-timers', 0x40001400, 0x0, 0x400, 'STM32L0x1'),
  ('TIM21', 'General-purpose-timers', 0x40010800, 0x0, 0x400, 'STM32L0x1'),
  ('TIM22', 'General-purpose-timers', 0x40011400, 0x0, 0x400, 'STM32L0x1'),
  ('LPUART1', 'Lower power Universal asynchronous receiver
      transmitter', 0x40004800, 0x0, 0x400, 'STM32L0x1'),
  ('NVIC', 'Nested Vectored Interrupt
      Controller', 0xE000E100, 0x0, 0x33D, 'STM32L0x1'),
  ('MPU', 'Memory protection unit', 0xE000ED90, 0x0, 0x15, 'STM32L0x1'),
  ('STK', 'SysTick timer', 0xE000E010, 0x0, 0x11, 'STM32L0x1'),
  ('SCB', 'System control block', 0xE000ED00, 0x0, 0x41, 'STM32L0x1');

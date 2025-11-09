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
      accelerator', 0x50060000, 0x0, 0x31, 'STM32F423'),
  ('TIM1', 'Advanced-timers', 0x40010000, 0x0, 0x51, 'STM32F423'),
  ('TIM8', 'Advanced-timers', 0x40010400, 0x0, 0x51, 'STM32F423'),
  ('ADC1', 'Analog-to-digital converter', 0x40012000, 0x0, 0x51, 'STM32F423'),
  ('TIM7', 'Basic timers', 0x40001400, 0x0, 0x51, 'STM32F423'),
  ('TIM6', 'Basic timers', 0x40001000, 0x0, 0x51, 'STM32F423'),
  ('CAN1', 'Controller area network', 0x40006400, 0x0, 0x321, 'STM32F423'),
  ('CAN2', 'Controller area network', 0x40006800, 0x0, 0x321, 'STM32F423'),
  ('CAN3', 'Controller area network', 0x40006C00, 0x0, 0x321, 'STM32F423'),
  ('CRC', 'Cryptographic processor', 0x40023000, 0x0, 0xD, 'STM32F423'),
  ('DBG', 'Debug support', 0xE0042000, 0x0, 0x11, 'STM32F423'),
  ('DFSDM2', 'Digital filter for sigma delta
      modulators', 0x40016400, 0x0, 0x400, 'STM32F423'),
  ('DFSDM1', 'Digital filter for sigma delta
      modulators', 0x40016000, 0x0, 0x400, 'STM32F423'),
  ('DAC', 'Digital-to-analog converter', 0x40007400, 0x0, 0x39, 'STM32F423'),
  ('DMA1', 'DMA controller', 0x40026000, 0x0, 0x400, 'STM32F423'),
  ('DMA2', 'DMA controller', 0x40026400, 0x0, 0x400, 'STM32F423'),
  ('EXTI', 'External interrupt/event
      controller', 0x40013C00, 0x0, 0x19, 'STM32F423'),
  ('FMPI2C', 'fast-mode Inter-integrated circuit', 0x40006000, 0x0, 0x2D, 'STM32F423'),
  ('FLASH', 'FLASH', 0x40023C00, 0x0, 0x19, 'STM32F423'),
  ('TIM12', 'General purpose timers', 0x40001800, 0x0, 0x3D, 'STM32F423'),
  ('TIM13', 'General purpose timers', 0x40001C00, 0x0, 0x3D, 'STM32F423'),
  ('TIM14', 'General purpose timers', 0x40002000, 0x0, 0x3D, 'STM32F423'),
  ('TIM9', 'General purpose timers', 0x40014000, 0x0, 0x3D, 'STM32F423'),
  ('TIM3', 'General purpose timers', 0x40000400, 0x0, 0x51, 'STM32F423'),
  ('TIM4', 'General purpose timers', 0x40000800, 0x0, 0x51, 'STM32F423'),
  ('TIM2', 'General purpose timers', 0x40000000, 0x0, 0x55, 'STM32F423'),
  ('GPIOF', 'General-purpose I/Os', 0x40021400, 0x0, 0x29, 'STM32F423'),
  ('GPIOH', 'General-purpose I/Os', 0x40021C00, 0x0, 0x29, 'STM32F423'),
  ('GPIOE', 'General-purpose I/Os', 0x40021000, 0x0, 0x29, 'STM32F423'),
  ('GPIOC', 'General-purpose I/Os', 0x40020800, 0x0, 0x29, 'STM32F423'),
  ('GPIOG', 'General-purpose I/Os', 0x40021800, 0x0, 0x29, 'STM32F423'),
  ('GPIOD', 'General-purpose I/Os', 0x40020C00, 0x0, 0x29, 'STM32F423'),
  ('GPIOB', 'General-purpose I/Os', 0x40020400, 0x0, 0x29, 'STM32F423'),
  ('GPIOA', 'General-purpose I/Os', 0x40020000, 0x0, 0x29, 'STM32F423'),
  ('TIM10', 'General-purpose-timers', 0x40014400, 0x0, 0x39, 'STM32F423'),
  ('TIM11', 'General-purpose-timers', 0x40014800, 0x0, 0x400, 'STM32F423'),
  ('TIM5', 'General-purpose-timers', 0x40000C00, 0x0, 0x55, 'STM32F423'),
  ('IWDG', 'Independent watchdog', 0x40003000, 0x0, 0x11, 'STM32F423'),
  ('I2C2', 'Inter-integrated circuit', 0x40005800, 0x0, 0x29, 'STM32F423'),
  ('I2C1', 'Inter-integrated circuit', 0x40005400, 0x0, 0x29, 'STM32F423'),
  ('I2C3', 'Inter-integrated circuit', 0x40005C00, 0x0, 0x29, 'STM32F423'),
  ('LPTIM', 'Low power timer', 0x40002400, 0x0, 0x21, 'STM32F423'),
  ('PWR', 'Power control', 0x40007000, 0x0, 0x9, 'STM32F423'),
  ('QUADSPI', 'QuadSPI interface', 0xA0001000, 0x0, 0x35, 'STM32F423'),
  ('RNG', 'Random number generator', 0x50060800, 0x0, 0x11, 'STM32F423'),
  ('RTC', 'Real-time clock', 0x40002800, 0x0, 0xA1, 'STM32F423'),
  ('RCC', 'Reset and clock control', 0x40023800, 0x0, 0x99, 'STM32F423'),
  ('SDIO', 'Secure digital input/output
      interface', 0x40012C00, 0x0, 0x85, 'STM32F423'),
  ('SAI', 'Serial audio interface', 0x40015800, 0x0, 0x400, 'STM32F423'),
  ('SPI5', 'Serial peripheral interface', 0x40015000, 0x0, 0x400, 'STM32F423'),
  ('SPI4', 'Serial peripheral interface', 0x40013400, 0x0, 0x400, 'STM32F423'),
  ('SPI1', 'Serial peripheral interface', 0x40013000, 0x0, 0x400, 'STM32F423'),
  ('SPI2', 'Serial peripheral interface', 0x40003800, 0x0, 0x400, 'STM32F423'),
  ('SPI6', 'Serial peripheral interface', 0x40015400, 0x0, 0x400, 'STM32F423'),
  ('SPI3', 'Serial peripheral interface', 0x40003C00, 0x0, 0x400, 'STM32F423'),
  ('SYSCFG', 'System configuration controller', 0x40013800, 0x0, 0x31, 'STM32F423'),
  ('USART3', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004800, 0x0, 0x1D, 'STM32F423'),
  ('UART4', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004C00, 0x0, 0x1D, 'STM32F423'),
  ('USART6', 'Universal synchronous asynchronous receiver
      transmitter', 0x40011400, 0x0, 0x1D, 'STM32F423'),
  ('USART2', 'Universal synchronous asynchronous receiver
      transmitter', 0x40004400, 0x0, 0x1D, 'STM32F423'),
  ('UART5', 'Universal synchronous asynchronous receiver
      transmitter', 0x40005000, 0x0, 0x1D, 'STM32F423'),
  ('UART7', 'Universal synchronous asynchronous receiver
      transmitter', 0x40007800, 0x0, 0x1D, 'STM32F423'),
  ('UART8', 'Universal synchronous asynchronous receiver
      transmitter', 0x40007C00, 0x0, 0x1D, 'STM32F423'),
  ('UART10', 'Universal synchronous asynchronous receiver
      transmitter', 0x40011C00, 0x0, 0x1D, 'STM32F423'),
  ('USART1', 'Universal synchronous asynchronous receiver
      transmitter', 0x40011000, 0x0, 0x1D, 'STM32F423'),
  ('UART9', 'Universal synchronous asynchronous receiver
      transmitter', 0x40011800, 0x0, 0x1D, 'STM32F423'),
  ('OTG_FS_DEVICE', 'USB on the go full speed', 0x50000800, 0x0, 0x375, 'STM32F423'),
  ('OTG_FS_HOST', 'USB on the go full speed', 0x50000400, 0x0, 0x1F5, 'STM32F423'),
  ('OTG_FS_PWRCLK', 'USB on the go full speed', 0x50000E00, 0x0, 0x5, 'STM32F423'),
  ('OTG_FS_GLOBAL', 'USB on the go full speed', 0x50000000, 0x0, 0x111, 'STM32F423'),
  ('WWDG', 'Window watchdog', 0x40002C00, 0x0, 0x11, 'STM32F423'),
  ('FSMC', 'Flexible static memory controller', 0x60000000, 0x0, 0x400, 'STM32F423'),
  ('ADC_Common', 'ADC common registers', 0x40012300, 0x0, 0x9, 'STM32F423');

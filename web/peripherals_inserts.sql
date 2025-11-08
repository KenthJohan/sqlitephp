-- Create table for peripherals
CREATE TABLE IF NOT EXISTS `peripherals` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` TEXT NOT NULL,
  `description` TEXT,
  `baseAddress` INTEGER NOT NULL,
  `offset` INTEGER,
  `size` INTEGER,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('ADC', 'ADC address block description', 1073816576, 0, 780);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('CRC', 'CRC address block description', 1073885184, 0, 24);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('DBG', 'DBG address block description', 1073829888, 0, 16);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('DMA', 'DMA register bank', 1073872896, 0, 1024);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('DMAMUX', 'DMAMUX address block description', 1073874944, 0, 328);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('EXTI', 'EXTI address block description', 1073879040, 0, 152);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('FLASH', 'FLASH register block', 1073881088, 0, 1024);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('GPIOA', 'GPIOA address block description', 1342177280, 0, 44);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('GPIOB', 'GPIOB address block description', 1342178304, 0, 44);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('GPIOC', 'GPIOC address block description', 1342179328, 0, 44);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('GPIOD', 'GPIOD address block description', 1342180352, 0, 44);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('GPIOF', 'GPIOF address block description', 1342182400, 0, 44);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('IWDG', 'IWDG address block description', 1073754112, 0, 20);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('I2C1', 'I2C address block description', 1073763328, 0, 44);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('I2C2', 'No description available', 1073764352, 0, 0);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('PWR', 'PWR address block description', 1073770496, 0, 128);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('RCC', 'RCC address block description', 1073876992, 0, 100);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('RTC', 'RTC address block description', 1073752064, 0, 96);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('SPI1', 'SPI address block description', 1073819648, 0, 34);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('SPI2', 'No description available', 1073756160, 0, 0);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('SYSCFG', 'Spider_SYSCFG register block', 1073807360, 0, 1024);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('TIM1', 'TIM1 address block description', 1073818624, 0, 108);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('TIM2', 'TIM2 address block description', 1073741824, 0, 108);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('TIM3', 'TIM3 address block description', 1073742848, 0, 108);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('TIM14', 'TIM14 address block description', 1073750016, 0, 108);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('TIM16', 'TIM16 address block description', 1073824768, 0, 108);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('TIM17', 'TIM17 address block description', 1073825792, 0, 108);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('USART1', 'USART address block description', 1073821696, 0, 48);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('USART2', 'No description available', 1073759232, 0, 0);
INSERT INTO `peripherals` (`name`, `description`, `baseAddress`, `offset`, `size`) VALUES ('WWDG', 'WWDG address block description', 1073753088, 0, 12);

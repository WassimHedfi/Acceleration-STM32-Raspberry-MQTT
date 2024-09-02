Find the STM32-nucleo code, to be integrated after configuration on stm32CubeIDE, on the repo [ADXL345 Driver for STM32](https://github.com/WassimHedfi/adxl345-driver-stm32).

The [STM32nucleoF446RE](https://www.st.com/en/microcontrollers-microprocessors/stm32f446re.html) is used for this project. 

The repo contains the uart driver for data transmission, and the i2c driver for the [adxl345 acceleration sensor](https://www.analog.com/en/products/adxl345.html). main.c contains an implimentation of the drivers that works perfectly for this data transmission. 

Note that we used Fast i2c, adding pullup resistors on the i2c pins would be great addition for data integrity.

@ECHO OFF
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "D:\AVR\CORE8_HC-SR04_Dalnomer\labels.tmp" -fI -W+ie -o "D:\AVR\CORE8_HC-SR04_Dalnomer\BOS.hex" -d "D:\AVR\CORE8_HC-SR04_Dalnomer\BOS.obj" -e "D:\AVR\CORE8_HC-SR04_Dalnomer\BOS.eep" -m "D:\AVR\CORE8_HC-SR04_Dalnomer\BOS.map" "D:\AVR\CORE8_HC-SR04_Dalnomer\CORE8.asm"

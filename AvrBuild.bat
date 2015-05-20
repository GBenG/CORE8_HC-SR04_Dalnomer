@ECHO OFF
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "D:\AVR\CORE8_HC-SR04\labels.tmp" -fI -W+ie -o "D:\AVR\CORE8_HC-SR04\BOS.hex" -d "D:\AVR\CORE8_HC-SR04\BOS.obj" -e "D:\AVR\CORE8_HC-SR04\BOS.eep" -m "D:\AVR\CORE8_HC-SR04\BOS.map" "D:\AVR\CORE8_HC-SR04\CORE8.asm"

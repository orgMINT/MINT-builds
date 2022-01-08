# MINT for the  Southern Cross Computer  in RAM

Bit Bang Serial  4800-N-8-2 with a 4MHz crystal oscillator.
6850 ACIA  Serial  115200-N-8-2 with the SC-SERIAL Add-On Board.



MINT is less than 2k in size so can easily be downloaded and run in the 8k RAM of the Southern Cross Computer. 

#### Downloading and running:

Using the Southern Cross Monitor  (V1.6) download the Mint executable as an Intel Hex file 

either using the Southern Cross Monitor command  Fn 1, or by invoking the Serial Monitor 

with Fn Fn and downloading it using the I command. The download does take a while at 4800 so be patient!

MINT is loaded from $2000 - $27ff

MINT uses RAM from $2800 and the program heap grows up from there.



Start Mint by executing G 2000 in the Serial Monitor or by entering the address 2000 and pressing Fn 0 in the Monitor.

If you are using a SC-SERIAL 6850 add-on board  remember to connect it to a terminal and select the IO addresses as $80 and $81 

### Bit Bang Serial  4800-N-8-2 with a 4MHz crystal oscillator.

####  Files:

SC-RAM-B.Z80     ASM-80 build file

SC-RAM-B.lst        Code listing

SC-RAM-B.hex       Intel Hex File



### 6850 ACIA  Serial  115200-N-8-2 with the SC-SERIAL Add-On Board.

####  Files:

SC-RAM-A.Z80     ASM-80 build file

SC-RAM-A.lst        Code listing

SC-RAM-A.hex       Intel Hex File

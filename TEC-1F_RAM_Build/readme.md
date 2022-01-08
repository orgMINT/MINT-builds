# MINT for the  TEC-1F in RAM

Bit Bang Serial  4800-N-8-2 with a 4MHz crystal oscillator.



MINT is less than 2k in size so can easily be downloaded and run in the 8k RAM of the TEC-1F  (in 8k memory map mode).

#### Downloading and running:

Using the Southern Cross Monitor for the TEC-1F  (V1.6) download the Mint executable as a Intel Hex file 

either using the Southern Cross Monitor command  GO 1, or by invoking the Serial Monitor 

with Go Go and downloading it using the I command. The download does take a while at 4800 so be patient!

MINT is loaded from $2000 - $27ff

MINT uses RAM from $2800 and the program heap grows up from there.



Start Mint by executing G 2000 in the Serial Monitor or by entering the address 2000 and pressing Go 0 in the Monitor.

####  Files:

TEC-1F-RAM-B.Z80     ASM-80 build file

TEC-1-RAM-B.lst        Code listing

TEC-1-ROM-B.hex       Intel Hex File






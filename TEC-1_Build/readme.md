# MINT for the  TEC-1 



2k ROM / 2k RAM

Bit Bang Serial  4800-N-8-2 with a 4MHz crystal oscillator.

TEC-1-ROM-B.Z80     ASM-80 build file

TEC-1-ROM-B.bin       Rom binary

TEC-1-ROM-B.lst        Code listing

TEC-1-ROM-B.lst        Intel Hex File



#### Seven Segment Code Table

Nibble to seven segment codes are built into the ROM, to get the 7 segment code
pass the nibble to the code at address #0058 and the equivalent seven segment code will be returned  on the stack. 

#0C  #0058 \X

#0C  = nibble to be converted

#0058 = address of conversion routine

#### **Intel Hex downloader**

The Mint ROM has a built in Intel Hex downloader that you can execute like this;

#000D \X

The code returns a 1 for a checksum error or 0 for success.

The following Mint code definitions provides a more user friendly wrapper;

:D `Download Intel Hex file\NSend File...\N` #000D \X;

:L 0=(`Hex load OK`)(`Checksum Fail`);

Then to execute;

DL


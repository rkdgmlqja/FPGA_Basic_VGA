# FPGA_Basic_VGA
Basic VGA control project on FPGA board

## Abstract 
This project focuses on how to design a RTL code that generates specific signal that matches to image resolution of monitor device.

## VGA signal spec

```
Name        1920x1080p60
    Standard      SMPTE 274M
    VIC                   16
    Short Name         1080p
    Aspect Ratio        16:9

    Pixel Clock        148.5 MHz
    TMDS Clock       1,485.0 MHz
    Pixel Time           6.7 ns ±0.5%
    Horizontal Freq.  67.500 kHz
    Line Time           14.8 μs
    Vertical Freq.    60.000 Hz
    Frame Time          16.7 ms

    Horizontal Timings
    Active Pixels       1920
    Front Porch           88
    Sync Width            44
    Back Porch           148
    Blanking Total       280
    Total Pixels        2200
    Sync Polarity        pos

    Vertical Timings
    Active Lines        1080
    Front Porch            4
    Sync Width             5
    Back Porch            36
    Blanking Total        45
    Total Lines         1125
    Sync Polarity        pos

    Active Pixels  2,073,600
    Data Rate           3.56 Gbps

    Frame Memory (Kbits)
     8-bit Memory     16,200
    12-bit Memory     24,300
    24-bit Memory     48,600
    32-bit Memory     64,800
```

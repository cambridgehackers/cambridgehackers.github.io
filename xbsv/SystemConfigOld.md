These are old notes migrated from: https://github.com/cambridgehackers/xbsv/wiki/SystemConfig    

1. Reversing the bytes in a file (to get vivado tools to put out same byte order as 'promgen -b'):
```
    xxd orig.bin | sed -e "s/  .*//" -e "s/ \(..\)\(..\) \(..\)\(..\)/ \\4\\3 \\2\\1/g" | xxd -r >xx.jk    
```
1. toolchain  
    https://sourcery.mentor.com/GNUToolchain/release858  
```
    wget https://sourcery.mentor.com/GNUToolchain/package4571/public/arm-none-linux-gnueabi/arm-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2  
    tar xjf arm-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2  
```

1. Making new ramdisk8M.image.gz (kernel requires that it be zero-padded to exactly 256kb) (now in zynq-boot Makefile)    
```
    find . | cpio -H newc -o | gzip -9 -n | dd of=../imagefile.image.gz bs=256k iflag=fullblock conv=sync   
```
1. To examine ramdisk8M.image.gz  
``` 
    gzip -cd ../imagefile.image.gz | cpio -imd   
```
1. To create split bitfile for loading from linux
```
    bootgen -image hdmidisplay.bif -split bin -o i boot.bin
    gzip hdmidisplay.bit.bin
```
Or      
```
    promgen -w -b -p bin -o hdmidisplay.bit.bin -u 0 implementation/hdmidisplay.bit -data_width 32
    gzip hdmidisplay.bit.bin
```

1. Debugging clocks  
    mount -t debugfs none /sys/kernel/debug/  
    ls -l /sys/kernel/debug/clk/ps_clk/iopll/FPGA1_CLK  

1. u-boot build (no longer used)  
```
   git clone git://git.xilinx.com/u-boot-xlnx.git
   cd u-boot-xlnx
   make CROSS_COMPILE=arm-none-linux-gnueabi- zynq_zc70x_config
   make -j CROSS_COMPILE=arm-none-linux-gnueabi- 
```

1. out of date devicetree instructions  
```
    cd device_xilinx_kernel/  
    ./scripts/dtc/dtc -I dts -O dtb -o devicetree.dtb arch/arm/boot/dts/zynq-zc702-bridge.dts  
    cp arch/arm/boot/zImage devicetree.dtb ../zynq-boot/imagefiles
    cd ../zynq-boot
    make 
```

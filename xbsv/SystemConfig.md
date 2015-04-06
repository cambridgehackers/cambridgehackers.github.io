1. Older notes moved to:
   * https://github.com/cambridgehackers/xbsv/wiki/SystemConfigOld

1. toolchain  
   * https://sourcery.mentor.com/GNUToolchain/release858  
```
    wget https://sourcery.mentor.com/GNUToolchain/package4571/public/arm-none-linux-gnueabi/arm-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2  
    tar xjf arm-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2  
```

```
    Source is at:
     wget https://sourcery.mentor.com/GNUToolchain/package4571/public/arm-none-linux-gnueabi/arm-2009q1-203-arm-none-linux-gnueabi.src.tar.bz2   
```

1. If having problems running arm-2009q1:
```
sudo apt-get install --reinstall libc6-i386
sudo apt-get install libgl1-mesa-glx:i386 lsb-core
```

1. Ubuntu 12.04 packages   
```
sudo apt-get install python-ply   
sudo apt-get install libgmp3c2   
```


1. kernel and boot.bin image repos   
```
    git clone git@github.com:cambridgehackers/zynq-boot.git
    git clone git@github.com:cambridgehackers/linux-xlnx.git  
    cd linux-xlnx/  
    git checkout remotes/origin/xbsv-2014.04 -b xbsv-2014.04  
```
1. compile linux kernel      
```
    cd device_xilinx_kernel/  
    make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- xilinx_zynq_portal_defconfig  
    make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-   
    cp arch/arm/boot/zImage ../zynq-boot/imagefiles/zImage    
```   
1. Make boot.bin file
   * https://github.com/cambridgehackers/zynq-boot
1. Format SD card, if needed
   * SD card must be partitioned.  boot.bin and linux filesystem images must be present on partition 1 (first partition).   

1. Make an SD card
```
Follow the instructions in README.md in the zynq-boot repo.  
```
1. To load bitfile for FPGA from linux
```
    mknod /dev/xdevcfg c 259 0
    cat /sys/devices/amba.2/f8007000.devcfg/prog_done
    gzip -cd hdmidisplay.bit.bin.gz >/dev/xdevcfg
    cat /sys/devices/amba.2/f8007000.devcfg/prog_done
```

1. To install device driver for digilent USB JTAG, follow the instructions at: http://www.george-smart.co.uk/wiki/Xilinx_JTAG_Linux  

1. On the HW-Z7-ZC702 eval board, the "ON" label on SW10 is backwards.  To use the digilent USB JTAG interface, switch 1 of SW10 should be positioned down (toward ethernet) and switch 1 should be up (toward SD slot).  

1. To use chipscope, follow the directions in section 4.2, http://www.xilinx.com/support/documentation/sw_manuals/xilinx14_3/ug873-zynq-ctt.pdf .  

1. For linux console output on Mac or Linux:
   * For Zedboard or ZC702:
      * Use xbsv/consolable/consolable as console.
   * if you want to use zterm for ZC702 on Mac, use SLAB_USBtoUART driver (driver built-in for zedboard): 
      * http://www.silabs.com/Support%20Documents/Software/Mac_OSX_VCP_Driver.zip  
      * 115k 8n1

1. For console output on Mac for Zedboard, this might be useful:
   * http://www.cypress.com/?id=4&rID=67834
1. Sample adb commands:
```
    adb disconnect             (needed if you had a previous 'adb connect' line w/different IP address)
    adb connect 172.17.1.167   (get the IP address from the 'Got DHCP answer' line in the boot console)
    adb ls /mnt/sdcard
    adb push bootnew.bin /mnt/sdcard
    adb shell 
    adb reboot                 (seems to be a safe way of shutdown/reboot)
    adb logcat       
```
1. Building android:
   * https://github.com/cambridgehackers/zynq-android4/wiki/ZynqAndroid4.1
   * https://gitorious.org/cambridge/pages/SysrootBuild
1. Getting familiar with Android source tree:
   * http://www.netmite.com/android/mydroid/development/pdk/docs/intro_source_code.html
   * http://stackoverflow.com/questions/9046572/how-to-understand-the-directory-structure-of-android-root-tree
1. Compiling xbsv/gralloc library:
```
    cd <android_source_directory>
    source ./build/envsetup.sh; lunch zedboard-userdebug
    cd <place_where_you_put_xbsv_repo>/gralloc/
    TOP=<android_source_directory> mm  
    output file is in <android_source_directory>/out/target/product/zedboard/system/lib/hw/gralloc.portal.so
```
   * NOTE: the xilinx GLIBCXX libraries conflict with the gcc system libraries used by the GCC cross compiler (xilinx versions are bad).  Because of this, the xilinx 'source xxxx' lines cannot be executed prior to compiling android.  
1. Verifying hdmi block
```
    #Attach hdmi display to board and power on.  (initialization of display done once-only, when fpga loaded)
    #(at this point, you should see the test pattern on the display)
    #Poweron/boot board
    #Follow the sequence above "To load bitfile"
    mknod /dev/xdevcfg c 259 0
    chmod a+rw /dev/fpga0
    cat /sys/devices/amba.2/f8007000.devcfg/prog_done
    gzip -cd /mnt/sdcard/hdmidisplay.bit.bin.gz >/dev/xdevcfg
    cat /sys/devices/amba.2/f8007000.devcfg/prog_done
    stop surfaceflinger

    sleep 5
    sleep 2
    start surfaceflinger
    #(at this point, the upper left corner of the display should have the android UI   
```
1. setting screen resolution
```
    setprop rw.screencode 2
    # this is default for 720 x 480
    getprop   
```
1. debugging with gdb (when doing full android build)
   * On target:
      *  gdbserver :5039 ./testimagecapture
   * On host:
      *  adb forward tcp:5039 tcp:5039
      *   ~jca/s/an/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin/arm-eabi-gdb  ~jca/s/an/out/target/product/zedboard/obj/EXECUTABLES/testimagecapture_intermediates/LINKED/testimagecapture  
    At host gdb prompt: 

```
        set solib-absolute-prefix /home/jca/s/an/out/target/product/zedboard/symbols  
        set solib-search-path /home/jca/s/an/out/target/product/zedboard/symbols/system/lib  
        target remote :5039  
        c  
``` 

1. debugging with gdb (when using ndk-build)
   * When building, specify NDK-DEBUG=1
   * On host:   
```   
       adb forward tcp:5039 tcp:5039   
       adb push examples/echo/zedboard/mkTop.bit.bin.gz /mnt/sdcard   
       adb push examples/echo/zedboard/libs/armeabi/android_exe /mnt/sdcard   
       adb shell gdbserver :5039 /mnt/sdcard/android_exe &    
       `ndk-which gdb` examples/echo/zedboard/libs/armeabi/android_exe  
```    
   * At host gdb prompt:   
``` 
         set solib-search-path examples/echo/zedboard/obj/local/armeabi/   
         target remote :5039   
         c   
```
Generic device bring-up steps
-----------------------------

-   Get unlocked device. The unlocking
    procedure varies by device. Just search on the web for ‘unlock
    bootloader **your device**’
-   Replace bootloader with one that is built with ‘fastboot’ support
    (lk for example).
    -   rewriting bootloader (and partition table) may require
        additional JTAG hardware and device JTAG support.
-   Get AOSP or vendor AOSP branch
-   Get vendor binaries (e.g. Qualcomm) for target chipset
-   Get any Nokia specific drivers (display, touch, camera, and other
    custom peripherals)
    -   Device driver/support may require modification of both the
        kernel and bootloader
-   Build OS using custom build manifest that incorporates vendor
    binaries and Nokia specific drivers. Recommend using build scripts
    on Jenkins server.

Generic flashing steps
----------------------

-   Flash custom OS images into device, using fastboot tool.
    -   Note, fastboot and adb are available on Ubuntu (\>=12.10)
        directly:

    sudo apt-get install android-tools-fastboot
    sudo apt-get install android-tools-adb

(If you are using 12.04, The packages still work. Dowload the packages
from the following pages, and install with ‘dpkg -i’.)

http://packages.ubuntu.com/quantal/android-tools-adb

http://packages.ubuntu.com/quantal/android-tools-fastboot

    adb reboot-bootloader
    fastboot flash system system.img
    fastboot flash userdata userdata.img

Before flashing boot.img, you should first try loading into ram and
booting

    fastboot boot boot.img

If there is a known way to get back to fastboot (key combinations),
and boot.img is known to work then the boot image (kernel) can also be
flashed. If unsure, do not flash boot, and load only into memory.

    fastboot flash boot boot.img

For the first flash, the persist and cache images should also be
written

    fastboot flash persist persist.img
    fastboot flash cache cache.img

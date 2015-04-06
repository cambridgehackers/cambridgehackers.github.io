    scp xxx:android33/out/target/product/maguro/system.img .
    adb reboot bootloader
    fastboot-mac erase cache
    fastboot-mac flash system system.img
    fastboot-mac flash boot boot.img
    fastboot-mac flash userdata userdata.img
    fastboot-mac reboot
    adb shell
    adb logcat
    adb install foo.apk
    adb pull /sdcard/Movies/webcam-video.3gp .
   * The Android Java UI is configured (4.1.1) from:
      * frameworks/base/core/res/res/values/config.xml  (for example: config_showNavigationBar turns on the 'on screen' navigation buttons)
   * The initial layout/defaults for the screen are done in:
      * frameworks/base/policy/src/com/android/internal/policy/impl/PhoneWindowManager.java:setInitialDisplaySize()

   * Filesystems
   * Encryption of /data and /system is requested by:
      * frameworks/base/core/java/android/os/Environment.java:isEncryptedFilesystemEnabled()
   * Encryption of /data is done by:
      * system/vold/cryptfs.c:cryptfs_enable()
   * It looks like setting "persist.security.efs.enabled=false" might turn this off.

   * Mapping of linux keycodes to Android keys is done in *.kl files.  For example:
      * device/asus/grouper/gpio-keys.kl

   * Configuration of things like 'use software emulation for opengles' are in BoardConfig.mk files.

   * Capture a baseline with repo:
      * repo manifest -r -o oldbaseline.xml

   * Udev rules for /etc/udev/rules.d : 
```
#xilinx
SUBSYSTEM=="usb", ATTRS{idVendor}=="1679", ATTRS{idProduct}=="2001",MODE="0666"
SUBSYSTEM=="usb", ATTRS{idVendor}=="3923", ATTRS{idProduct}=="717b",MODE="0666"
#panda
SUBSYSTEM=="usb", ATTRS{idVendor}=="0451", ATTRS{idProduct}=="d022",MODE="0666"
```

   * Updating git on a repo build tree:
      * git remote add foo URL
      * git fetch foo
      * git checkout HEAD -b master
      * git push foo master

   * Disable web security on Safari:
      * open -a '/Applications/Safari.app' --args --disable-web-security

![Overall workflow](https://chart.googleapis.com/chart?cht=gv&chs=500x500&chl=digraph%20G%20{%20%20additional_Android_packages%20-%3E%20device_image;%20commercial_device%20-%3E%20extracted_repo;%20extracted_repo%20-%3E%20device_image;%20upstream_sources%20-%3E%20sysroot%20[weight=8];%20sysroot%20-%3E%20device_image%20[style=dotted];%20SuSE_packages%20-%3E%20chroot;%20sysroot%20-%3E%20chroot%20[style=dotted];%20chroot%20-%3E%20binary_rpm;%20binary_rpm%20-%3E%20device_image;%20device_image%20-%3E%20flash_files%20})


   * Get a commercial Android device with the following:
      * Flash image files for boot.img and system.img
      * A way to flash img files to the device (for example fastboot)

   * To build software:
      * Try to locate the closest Android source version (but does not need to be exact)
      * Use a reference sysroot (located at 'tiny') for this version as a base for building new packages
      * Copy *binary* files from the phone reference flash images into the sysroot, as necessary
      * run 'make' on the sysroot, producing new boot.img and system.img files
      * use these files to flash the device

   * Software builds can be done in 2 different ways:
      1. using the sysroot and .repo/local_manifest.xml, you can load any 'Android compatible' package and just build it.  (Note that this build will also produce the boot.img and system.img files)
      2. using the profbuild environment, you can do an rpmbuild against the sysroot, producing a binary RPM package.  Using rpm2cpio, install this package into the out/target directory of a sysroot.  Following the installation of all necessary files into the sysroot, typing 'make' will produce boot.img and system.img files for flashing



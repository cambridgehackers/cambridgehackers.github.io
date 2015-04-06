![rpm structure](https://chart.googleapis.com/chart?cht=gv&chs=500x300&chl=digraph%20G%20{%20upstream_sources%20-%3E%20sysroot%20[weight=8];%20sysroot%20-%3E%20gcc_rpm%20sysroot%20-%3E%20devel_rpm%20sysroot%20-%3E%20devel_static_libraries_rpm%20sysroot%20-%3E%20orig_flash_files_rpm%20gcc_rpm%20-%3E%20work_area%20devel_rpm%20-%3E%20work_area%20devel_static_libraries_rpm%20-%3E%20work_area%20[style=dotted];%20work_area%20-%3E%20flash_files%20})

Preparation:

To run this build on Ubuntu 11.04 and 12.04:
    sudo apt-get install bison flex lib32gcc1 lib32z1-dev lib32stdc++6 ia32-libs lib32ncursesw5 libxml2-utils g++ xsltproc gperf

On Ubuntu 10.04, this has been recommended:
    sudo apt-get install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev ia32-libs x11proto-core-dev libx11-dev lib32readline5-dev lib32z-dev libxml-simple-perl g++

Install repo:
    curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo  
    chmod a+x ~/bin/repo
    export PATH=~/bin:$PATH

To get started for Google Galaxy Nexus phone:

    git clone git://gitorious.org/cambridge/klaatu-manifests.git
    mkdir test
    cd test
    ../klaatu-manifests/scripts/fullbuild android-4.1.1_r4
    source build/envsetup.sh
    lunch full_maguro-userdebug
    make -j33
    ../klaatu-manifests/scripts/buildrpm      (assumes rpmbuild exists as a tool)

For Google Nexus 7 tablet:
    lunch full_grouper-userdebug

To get started for bsquare MSM8960 smartphone:
    git clone git://gitorious.org/cambridge/klaatu-manifests.git
    mkdir test
    cd test
    ../klaatu-manifests/scripts/fullbuildq ics_chocolate M8960AAAAANLYA1031A.xml
    source build/envsetup.sh
    choosecombo 2 msm8960 eng

Proprietary binaries that are needed for this source version are in:
    Documents and Downloads/Multi-Rev Multi-Build/M8960.LA.1.0 (M8960AAAAANLYD103150)

Modify adb_usb.ini so that adb will see your msm8960 device:
    echo '0x0956;0x9039' > ~/.android/adb_usb.ini

Reference output images are periodically placed in:
   * [http://code.google.com/p/klaatu/downloads/list](http://code.google.com/p/klaatu/downloads/list)



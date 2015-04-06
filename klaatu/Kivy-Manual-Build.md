Kivy for Klaatu Manual Build and installation
---------------------------------------------

There is now an option to include kivy in the klaatu build. These
instructions are for manual build and deployment, useful for kivy/klaatu
platform development.

This build depends on the device-native klaatu\_window library. These
instructions will assume that you already have a device with a
klaatu/kivy image on it which contains this library. If this is not the
case, you must first build the library for your target device yourself
from the source located here:\
https://gitorious.org/cambridge/klaatu-services/source/libs/window

First, set up this:
http://python-for-android.readthedocs.org/en/latest/prerequisites/

Then, check out p4a:

    git clone https://github.com/kivatu/python-for-android.git

Get klaatu window library for target device:

     
    mkdir -p python-for-android/external/libs
    adb pull /system/lib/libklaatu_window.so python-for-android/external/libs

then build:

    cd python-for-android
    export KIVY_TARGET_KLAATU=1
    export KIVY_KLAATU_LDIR=$PWD/external/libs
    ./distribute.sh -m "pil kivy"

Installing on a device
----------------------

    adb root
    adb remount
    cd dist/default
    adb push python-install /system
    adb push private /system/lib/python-private
    adb push libs/armeabi /system/lib
    adb shell

Set up environment variables on the device:

    export EXTERNAL_STORAGE=/mnt/sdcard
    export LANG=en
    export PYTHONPATH=/system/lib:/system/lib/python2.7:/system/lib/python2.7/site-packages
    export TEMP=/mnt/storage/com.googlecode.pythonforandroid/extras/python/tmp
    export PYTHON_EGG_CACHE=$TEMP
    export PYTHONHOME=/system
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/system/lib/python2.7:/system/lib/python2.7/lib-dynload:/system/lib/python2.7/site-packages
    export ANDROID_ARGUMENT=1
    #ANDROID_PRIVATE should point to libpymodules.so (due to custom-loader.patch)
    export ANDROID_PRIVATE=/system/lib/python-private
    export ANDROID_APP_PATH=/data/app
    export KIVY_WINDOW=egl_klaatu
    export KIVY_PLATFORM_KLAATU=1

now run kivy apps!

    python /system/share/kivy-examples/demo/touchtracer/main.py

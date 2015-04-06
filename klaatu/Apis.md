## Communications
   * bluetooth
      * moved on 4.2 from bluez/dbus to bluedroid (BCOM donated stack)
   * cellular telephony
      * hardware/ril/include/telephony/ril.h
   * wlan
      * hardware/libhardware_legacy/include/hardware_legacy/wifi.h
      * system/core/include/netutils/dhcp.h

## Multimedia
   * audio path switching/volume
      * frameworks/av/include/media/AudioSystem.h
   * tones
      * frameworks/av/include/media/ToneGenerator.h
   * audio sample playback (only 16bit PCM)
      * frameworks/av/include/private/media/AudioTrackShared.h
      * system/core/include/system/audio.h
      * frameworks/av/include/media/IAudioFlinger.h
   * graphics
      * frameworks/native/include/ui/DisplayInfo.h
      * frameworks/native/include/ui/FramebufferNativeWindow.h
      * frameworks/native/include/gui/SurfaceComposerClient.h
   * FM
      * [No standard solution; all vendor specific](https://groups.google.com/forum/?fromgroups=#!topic/android-porting/qs_XHukOuyg)
   * camera
      * frameworks/av/services/camera/tests/CameraServiceTest/CameraServiceTest.cpp
      * hardware/libhardware/tests/camera2/camera2.cpp
   * video
   * codecs: OMX
   * DRM
   * [Media Player](http://developer.android.com/reference/android/media/MediaPlayer.html)
      * frameworks/av/include/media/mediaplayer.h

## I/O
   * sensors: accelerometer/GPS/proximity/gyroscope/compass/ambient_light/temperature/pressure
      * frameworks/native/include/android/sensor.h
      * frameworks/native/include/gui/Sensor.h
      * frameworks/native/include/gui/SensorManager.h
      * frameworks/native/include/gui/SensorEventQueue.h
   * keys/touch
      * frameworks/base/services/input/InputReader.h
   * led
      * hardware/libhardware/include/hardware/lights.h
   * SIM
      * RIL
   * NFC

## System
   * pm (wakelocks)
      * frameworks/native/include/powermanager/IPowerManager.h
   * [security](http://source.android.com/tech/security/index.html)
   * [update](http://www.csee.usf.edu/~nsamteladze/res/projects/research/delta/lcn-paper.pdf)
   * [tracing](http://elinux.org/Android_Logging_System)
   * scripting
   * production testing/tuning

## Linux
   * display
   * SD cards
   * timers
   * usb
   * posix
   * gpio
   * vibra
      * hardware/libhardware_legacy/include/hardware_legacy/vibrator.h
      * (just uses "/sys/class/timed_output/vibrator/enable")
   * em
      * display from Linux: "/sys/class/power_supply"

## Other
   * fonts?
   * IME?
   * ICU?
   * Keymaps?
   * test-runner?
   * gtest?
   * voip?


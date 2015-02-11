---
title: Simplifying Zynq Boot
layout: post
tags: connectal
---

Creating a Zynq boot.bin has been a source of headaches for quite some
time. It requires a toolchain different from the one in NDK build and
also seems to have some dependences on variations of other common Unix
tools.

The only reason anyone has to build a boot.bin themselves is because
it contains the MAC address for the ethernet. On the zedboard, at
least, there is not a better place to store it. Zybo does have an
eeprom for this purpose, but we do not have that working yet.

I'm working on a web-hosted development environment, and as part of
that took a step towards packaging zynq-boot in an easier to use way.

I packaged the stable, board-independent pieces into sdcard-zynq.zip
and the faster changing or board-dependent components into
bootbin-$(BOARD)-$(MACADDR).zip. If you only have one board of a
particular type, you can use a prebuilt bootbin.zip. Otherwise, you'll
still need to be able to build boot.bin or to use the web-hosted
boot.bin creation service when it's available.

The current prebuilt images for zedboard, zc702, and zc706 are here:

    https://github.com/cambridgehackers/zynq-boot-filesystems/tree/v15.02.1

From that link, download:

* https://github.com/cambridgehackers/zynq-boot-filesystems/blob/v15.02.1/sdcard-zynq.zip

also download a bootbin*.zip for your board:

* zedboard: https://github.com/cambridgehackers/zynq-boot-filesystems/blob/v15.02.1/bootbin-zedboard-00e00c009603.zip
* zc702: https://github.com/cambridgehackers/zynq-boot-filesystems/blob/v15.02.1/bootbin-zc702-00e00c005603.zip
* zc706: https://github.com/cambridgehackers/zynq-boot-filesystems/blob/v15.02.1/bootbin-zc706-00e00c004f03.zip

My SD card is labeled "ZYNQ" and under Ubuntu mounts as
/media/jamey/ZYNQ. On OS X it mounts as /Volumes/ZYNQ. Update the
following with the path to your SD card:

   unzip sdcard-zynq.zip
   cp sdcard-zynq/* /media/jamey/ZYNQ
   unzip bootbin*.zip
   cp bootbin*03/* /media/jamey/ZYNQ

Now eject your SD card, plug it into the Zynq board, and turn it on.

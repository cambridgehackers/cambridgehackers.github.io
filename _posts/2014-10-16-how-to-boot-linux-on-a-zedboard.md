---
title: How to boot Linux on a Zedboard without U-Boot
layout: post
tags: instructable zynq android
---

We published an Instructable describing [how to boot Android Linux on a Zedboard without using U-Boot](http://www.instructables.com/id/How-to-boot-Linux-on-a-Zedboard-without-U-Boot/).

Normally, the Zynq CPUs boot by running the first stage boot loader
(FSBL) in ROM, to load the FSBL from the boot.bin file, which then
loads [U-Boot]() from the SD Card, which then loads the Linux kernel,
ramdisk, and device-tree from the SD Card.

The FSBL and U-Boot images are both board-dependent, and U-Boot does
not actually provide any capabilities missing from the FSBL and Linux,
so we thought it would be simpler if we didn't have to update U-Boot
when porting [Connectal](http://github.com/cambridgehackers/connectal)
to a ne Zynq board.

This
[Instructable](http://www.instructables.com/id/How-to-boot-Linux-on-a-Zedboard-without-U-Boot/)
describes how to set up a Zedboard to boot Linux directly from the
boot.bin file.

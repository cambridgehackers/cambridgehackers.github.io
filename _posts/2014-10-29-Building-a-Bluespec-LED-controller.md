---
title: Building a Bluespec LED controller using Connectal Build
layout: post
tags: instructable bluesim connectalbuild
---

We published an Instructable describing [how to build a simple LED
controller using Connectal
Build](http://www.instructables.com/id/Building-a-Bluespec-LED-controller-using-Connectal/).

One of the problems with CAD tools is that they are hard to install
and often expensive. Fortunately, we are able to provide a public
build service for open source projects written in [Bluespec Systems
Verilog](http://www.bluespec.com) using the [Connectal
framework](http://github.com/cambridgehackers/connectal).

This tutorial explains how to use the public [Connectal Build
service](https://connectablbuild.qrclab.com) to build and simulate an
application with hardware and software components written in BSV and
C++ using the Connectal Framework.

We assume that you will store your design sources in a publicly
available Git repository such as Github. The build service, which is
based on buildbot, automatically builds your project when it detects
changes. If you are simulating your design, the build service runs the
applications and displays the logs automatically.

This tutorial builds the example and runs it in the bluesim simulator.

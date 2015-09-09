---
title: Bundling Bitstreams into Applications
layout: post
tags: connectal
---

One of the problems we wrestled with for a while was version skew
between application executables and their corresponding FPGA
bitstreams.

We thought about embedding an application ID and version register into
the programmable logic and then checking it when the application
software connects to the hardware. This approach runs into the same
problem as the version numbers on Linux shared objects. It leads to
manual management of the version number, distinguishing compatible
from incompatible changes.

Another problem is keeping track of which bitstreams are associated
with an application.

Eventually, we decided just to embed the bitstream into the
application executable, and then extended this approach to work with
shared libraries, although it will currently only work with one shared
library per application.

When the application or library first uses the hardware, it
automatically invokes fpgajtag to program the hardware, pointing
fpgajtag at the executable or shared library itself. The fpgajtag
utility extracts the bitstream from the "fpgadata" section, which was
added at build time, and programs the hardware with it. Once this has
completed, the application software may safely use the hardware.
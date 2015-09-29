---
title: Connectal: Connecting Hardware to Software
layout: post
tags: connectal
---

\begin{wrapfigure}{l}{.5\textwidth}
  \centering
  \includegraphics[width=0.5\columnwidth,page=1]{fig/connectal-system.pdf}
  \caption{Connectal Server and Embedded FPGAs}
  \label{fig:ConnectalFPGA}
\end{wrapfigure}

The digital design flow that we are developing is aimed at teams
building SoCs containing processors for handling higher-level
application functions \textcolor{blue}{integrated with} hardware-accelerator blocks to get
acceptable performance at acceptable power.  When building such
systems currently, various teams develop components in isolation:
application software, kernel software, accelerator kernel hardware
blocks, memory interfaces, \emph{etc}.  Often a separate systems integration
(SI) team pulls together all the resulting pieces into a single,
working system, finding interface inconsistencies and receiving
updates from the individual teams.  The SI team is usually under
considerable time pressure, so they have to fix individual components
themselves so that integration work can proceed.

After an integrated ASIC design has been assembled and system tests
done, it is passed to a backend team.  They now go though a similar
process, making decisions orthogonal to the ones made earlier by the
SI team: power domains, clock trees, pin buffers and assignment,
signal delay measurement.  All of these decisions are tied to a 
particular version of the design the backend team received and
need to be incrementally updated as new engineering releases of
that design become available (often due to last-minute detection
of bugs or specification changes).

Having all these teams independently running in parallel leads to
considerable communication overhead (often simple email) and poor
recordkeeping of how decisions were made about tradeoffs along
the way.
Additionally, the mechanics of managing all the separately maintained
engineering tasks can be overwhelming (``Is this a patch to yesterday's
version?  Are the workarounds from last week still needed for
the second version I received from you today?'').
It all adds up to high expense and high project schedule risk.
\textcolor{blue}{Because of the difficulty and risk of pulling updates to the design,
fixes to functionality problems discovered after the design has been
handed off to the backend team often do not make it into the 
manufactured chip.}


We are developing a framework
called \emph{Connectal}~\cite{Connectal:www,King:2015:SHD:2684746.2689064}
that solves these problems as follows:
\begin{itemize}
\item Providing a standard template for the toplevel configuration of the
project.  This allows an unmodified hardware design to be run 
on multiple simulators, multiple versions of FPGAs, and multiple backend
workflows by factoring out
\textcolor{blue}{environment-specific information}
into a separate automated orchestration
toolchain.  
\item Automate the coordinated build of hardware, software, and backend
parameters via a simple single makefile-based dependency build environment.
The dependency build approach speeds up incremental engineering work
by only regenerating the components that changed in the last revision,
leading to a large reduction in elapsed time to validate changes.  Of
course, at release time, it is necessary to do a `clean build' of all
components to reconfirm that a consistent set of sources is indeed 
being captured and version controlled for releases.
\item Libraries provide commonly used functions.  By reusing heavily tested or formally verified
components from libraries, design teams need to only verify their own
code, feeling confident that the reused components are reliable and complete.
\item Tools are provided for commonly performed tasks.  Since the
design is built in a stylized way from the template, it now becomes
practical to invest in tools that help debugging and other tasks all along
the design flow.  By having a standard way to manage new tools
and to refer to existing tools from 3rd parties, it becomes easier
for teams to share the critical know-how about the mechanics of
using the tools in an efficient manner.
\item Interface generation tools are used to provide high confidence
that the design will not fail on the software/hardware interface.
Since this interface is owned by neither the software nor the hardware
toolchains, debugging problems at this level is often
quite difficult and time-consuming.  Connectal's interface compiler generates both
Bluespec and C++ interface files for the application to use when
crossing the boundary, as well as libraries and standardized trace
test techniques for isolating problems.  These generated interfaces
are implemented as memory-mapped hardware FIFOs, giving clarity
\textcolor{blue}{of} operation necessary for precise construction of synchronization
primitives.  In addition, as a result of the ease of generation of an 
interface from a user's specification,
it becomes easy to deploy interfaces for the wide variety of ad-hoc requests
needed for hardware initialization.
\item Bus master memory interfaces for the hardware make it
easy for the accelerator hardware kernel to issue requests to 
read or write memory and receive asynchronously the results.  A
simple memory management unit is available as a library, allowing
hardware to reference memory with linear addressing, even if it
is allocated as non-contiguous blocks (in running software systems
it can be difficult to allocate large contigous blocks of storage
due to fragmentation).  Since the memory interfaces are available
as configurable blocks they are both highly tested, reliable components,
and they have been integrated into the standard template, allowing
seemless testing of the application kernel in both simulation
environments and FPGAs in addition to production synthesis for an ASIC.
\item Version controlled source management and integrated build of
both the software and hardware for an application allows fine-grained
tracking of changes across software, hardware, tool flow that need to be made
in a coordinated manner.  By examining the history of the changes,
it now becomes easy to both track down the person/reason for the 
change, but also to do a `bisect'~\cite{gitbisect} to discover when a change was
made that broke a particular test.
\end{itemize}

\paragraph{Old text}


\begin{figure}
  \centering
  \includegraphics[width=\columnwidth,page=1]{fig/connectal-hardware-software.pdf}
  \caption{Connectal software to hardware interfaces}
  \label{fig:ConnectalInvokingHardware}
\end{figure}

Device drivers are often a barrier to the easy connection of software
and hardware components. Device drivers are written to execute in a
very special software environment with particular
restrictions. Connectal avoids the need for accelerator-specific
device drivers by enabling user mode software to connect directly to
the hardware. A generic device driver enables application or library
software to map the accelerator interface's into its own address
space.  In addition, the generic device driver also enables user mode
software to sleep until woken from an interrupt by the accelerator.

The left half of Figure~\ref{fig:ConnectalInvokingHardware} shows
user-mode software using Connectal-generated code to invoke an
interface method on a hardware accelerator. Note that the software
interacts directly with the hardware --- device driver is
bypassed. The right half of the figure shows hardware waking software
via an interrupt. The generic hardware device driver is involved,
handling the interrupt and waking any sleeping threads.

Use of generated code and a variety of transports enables mix and
match of software and hardware components. Using code generated from
the declarations makes it easy to track changes to interfaces as the
system definition evolves.

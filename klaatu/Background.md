
Here is a simple diagram of the components in the Android software stack:

<img src="https://gitorious.org/cambridge/cambridge-gitorious-wiki/blobs/raw/master/images/android.png">

The Android software stack has been put together with quite a clean design:

   * Vendor adaptation: linux kernel and in selected user space libraries and processes
   * Android "core": a C/C++ set of libraries and applications for startup, communications, media, graphics processing
   * Android "middleware": provide a rich set of services for Dalvik applications
   * Zygote system process: includes both shared system services for applications as well as window manager functionality

The goal of this project is to cut the Android s/w stack below the Dalvik layer, enabling other projects to experiment with non-Dalvik approaches to constructing user applications.  To do this, the following steps are done:

   * Remove Applications, Middleware and Dalvik from the software build
   * Add busybox and a few replacement servers
   * Document the upper interface of the Android core pieces
   * Experiment with several different application frameworks, including:
      * Qt/QML
      * Python/Kivy
      * HTML5 (probably both Mozilla and Webkit)
      * Game engines

Why are we doing this?

   * Application frameworks, like the Android middleware, are so complex that it is easy to 'add' to them, but radically different approaches (like an HTML5-centric application ecosystem) are quite difficult to try
   * By carefully documenting/supporting the "below Dalvik" layer, it makes the 'testing of deliverables' from the hardware adaptation more precise and accurate.
   * By allowing experimentation in different UI frameworks, it is hoped that teams will be able to make appliances running in far smaller devices than would be required if the entire Android application ecosystem was supported.



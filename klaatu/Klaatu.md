Klaatu
------

Klaatu is a minimal linux system containing AOS kernel, HAL and low
level daemons. With other AOS systems, several services depended on the
Java engine (Dalvik). As the Klaatu system contains no Java engine, some
additional services (daemons) are required to create a fully functional
system.

-   wifi/networking
-   bluetooth
-   power management
-   messaging

Service daemon functionality is accessed via binder interfaces.

Other functionality may be accessed via existing AOS interfaces:

-   See [Apis](https://gitorious.org/cambridge/pages/Apis)

One of several reference UI’s may be used to demonstrate the system:

-   Headless (command line only)
-   Qt
-   Webkit
-   Native OpenGLES interface

### Basic Klaatu architecture

    _____________________________________________________________________________________________________
          [ Example UI (Webkit, OpenGLES or headless ]
    _____________________________________________________________________________________________________
                                     ( binder interface )
               [ klaatu_qmlscene ]   [ klaatu_phoneservice ] [ klaatu_wifiservice ] [klaatu_powermanager]
    _____________________________________________________________________________________________________
    [ binder ] [ surface flinger ]   [ rild]                 [ wpa_supplicant ]
    _____________________________________________________________________________________________________
    [ Stagefright ]
    _____________________________________________________________________________________________________
    HAL libs/daemons (hw support)
    _____________________________________________________________________________________________________
    android kernel (hw support)
    _____________________________________________________________________________________________________

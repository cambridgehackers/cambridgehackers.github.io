Build
-----

Kivy can be included automatically as a UI in a klaatu build. Simply
specify it using build flags like so:

    build_maguro_klaatu.sh --include-kivy

Note: You may need to set up the prerequisites on your build server.
See:

http://python-for-android.readthedocs.org/en/latest/prerequisites/

and follow the installation instructions until the SDK part. The SDK/NDK
installation should not be necessary.

IMPORTANT: Use cython v0.19.2 as 0.20 may not work. pip install
cython==0.19.2

For manual build and deploy instructions, click here: [[Manual Build
|Kivy Manual Build]]

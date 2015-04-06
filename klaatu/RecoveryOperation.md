
The recovery tool executes commands written to /cache/recovery/command. While it is running, it writes to /cache/recovery/log. When it is done, it removes the command file.

To install an ota package via the standard recovery partition:
1. cp foo-ota-eng.jamey.zip /data/foo-ota-eng.jamey.zip
2. mkdir -p /cache/recovery
3. echo '--update_package=/data/foo-ota-eng.jamey.zip' > /cache/recovery/command

Then reboot into recovery mode and watch the spinning whatsit in the robot's chest.

Afterwords, you should be able to cat /cache/recovery/last_log to see what happened.

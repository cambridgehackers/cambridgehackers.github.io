Build instructions
==================

Basic builds require the ‘mirror’ directory (or link to mirror
directory), and the ‘patches’ directory to reside at the same directory
level as the scripts directory.

So the basic setup is:

    mkdir mirror

or

    ln -s /var/lib/jenkins/mirror .

    git clone git://gitorious.org/cambridge/klaatu-manifests.git klaatu-manifests

### Manual builds

Build scripts may be built directly, by calling the build script from a
build directory.

    mkdir build
    cd build
    ../scripts/build_aaa.sh

(where aaa is your desired build)

Note: Custom Jenkins builds are suggested rather than manual builds.
This allows for faster builds, build consistency, and better group build
visibility/activity. See below.

### Jenkins builds

The build scripts may be called from Jenkins by using the
jenkins\_build.sh wrapper. The build script is passed as an argument and
is assumed to reside in the same directory as the jenkins\_build.sh
wrapper.

Jenkins build step:

    /var/lib/jenkins/scripts/jenkins_build.sh build_aaa.sh

### Custom Jenkins builds

For custom build scripts or to test changes, custom build scripts may be
used from Jenkins.

setup a local build area (in your home directory).

    git clone
    git://gitorious.org/cambridge/klaatu-manifests.git klaatu-manifests
    ln -s /var/lib/jenkins/mirror .

modify scripts, patches as needed …
Add job in Jenkins. Copy similar existing one, then change build
step to refer to your scripts.
    /home/you/somewhere/scripts/jenkins\_build.sh
    build\_aaa.sh build\_aaa.sh

The --build-dir argument may be passed to always build in the same
directory , and the --no-mirror-sync may be used to avoid the sync of
the mirror itself.
    
   /home/you/somewhere/scripts/jenkins\_build.sh
    build\_aaa.sh —build-dir=/home/you/builds/aaa build\_aaa.sh
    --no-mirror-sync

Build using Jenkins.

### Mirror notes

For new build machines, It is suggested that you start with a copy
of an existing mirror:

    scp -r somehost:/var/lib/jenkins/mirror/ mirror/

or specific mirrors:

    sudo rsync -av $USER@somehost:/var/lib/jenkins/mirrors/repos/android_googlesource_com_platform /var/lib/jenkins/mirror/repos/

    sudo rsync -av $USER@somehost:/var/lib/jenkins/mirror/repos/codeaurora_org_platform_release /var/lib/jenkins/mirror/repos/

Note, the mirror is assumed to be installed in /home/jenkins/mirror (or
perhaps /var/lib/jenkins/mirror). In order to use the copied mirror,
place the mirror in the same location as it existed on the source
machine.

Note: the default home directory for the user jenkins is
/var/lib/jenkins

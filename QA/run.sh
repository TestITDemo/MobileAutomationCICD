#!/bin/sh

# Accepting parameters
GROUP=$1

echo "run.sh started with group: $GROUP."

# Delete EMU lock files
echo "Delete EMU avd lock files"
rm -f /root/.android/avd/EMU.avd/multiinstance.lock /root/.android/avd/EMU.avd/hardware-qemu.ini.lock

# Modify the screen size and density of the AVD
#sed -i 's/hw.lcd.height\s*=\s*1920/hw.lcd.height = 1440/g' /root/.android/avd/EMU.avd/config.ini
#sed -i 's/hw.lcd.width\s*=\s*1080/hw.lcd.width = 720/g' /root/.android/avd/EMU.avd/config.ini
#sed -i 's/hw.lcd.density\s*=\s*480/hw.lcd.density = 320/g' /root/.android/avd/EMU.avd/config.ini

echo "Emulator config:"
cat /root/.android/avd/EMU.avd/config.ini

# Start the emulator
echo "Starting the emulator..."
/opt/android-sdk/emulator/emulator -avd EMU -use-system-libs -no-audio -no-window -no-boot-anim &

# Wait for the emulator to start, up to 120 seconds
SECONDS=0
WAIT_TIME=120
while ! adb shell getprop sys.boot_completed > /dev/null 2>&1; do
    if [ "$SECONDS" -ge "$WAIT_TIME" ]; then
        echo "Emulator did not start in $WAIT_TIME seconds."
        # Delete EMU lock files
        echo "Delete EMU avd lock files"
        rm -f /root/.android/avd/EMU.avd/multiinstance.lock /root/.android/avd/EMU.avd/hardware-qemu.ini.lock
        exit 1
    fi
    echo "Waiting for the emulator to start: $SECONDS seconds..."
    sleep 1
    SECONDS=$((SECONDS+1))
done

# Emulator has started
echo "Emulator started successfully!"
adb devices

# Wait for full Android OS boot, up to 120 seconds
SECONDS=0
WAIT_TIME=120
while [ "$(adb shell getprop sys.boot_completed)" != "1" ]; do
    if [ "$SECONDS" -ge "$WAIT_TIME" ]; then
        echo "Android OS did not fully boot in $WAIT_TIME seconds."
        # Delete EMU lock files
        echo "Delete EMU avd lock files"
        rm -f /root/.android/avd/EMU.avd/multiinstance.lock /root/.android/avd/EMU.avd/hardware-qemu.ini.lock
        exit 1
    fi
    echo "Waiting for Android OS to fully boot up: $SECONDS seconds..."
    sleep 1
    SECONDS=$((SECONDS+1))
done

# Emulator has started
echo "Android OS booted successfully!"

echo "Wait 10 sec before apk install..."
sleep 10
echo "Installing ApiDemos-debug.apk..."
# TOCHECK 1: replace the <APKName> part with the correct name, then use(uncomment) the line below.
#		!Before you do this, check that you have done the TODO in Dockerfile
adb -e install /opt/android-sdk/platform-tools/ApiDemos-debug.apk

#appium version
echo "Appium version:"
appium -v

#install uiautomator2
appium driver install uiautomator2 2> /dev/null

#installed drivers
echo "Installed drivers:"
appium driver list --installed

# Run robot framework tests based on the given group parameter
echo "Calling RobotFramework test suites..."

case $GROUP in
    group1)
        # TOCHECK 2: Adjust the paths and commands for group1 tests
        mkdir /RF/results
        mkdir /RF/results/AlertDialogTests
        robot -d results/AlertDialogTests --timestampoutput /RF/AutomationDemo/tests/test_suites/AlertDialogTests.robot
        ;;
    group2)
        # TOCHECK 2: Adjust the paths and commands for group2 tests
        mkdir /RF/results
        mkdir /RF/results/SmokeTests
        robot -d results/SmokeTests --timestampoutput /RF/AutomationDemo/tests/test_suites/SmokeTests.robot
        ;;
    group3)
        # TOCHECK 2: Adjust the paths and commands for group3 tests
        mkdir /RF/results
        mkdir /RF/results/BrowserTests
        robot -d results/BrowserTests --timestampoutput /RF/AutomationDemo/tests/test_suites/BrowserTests.robot
        ;;
    *)
        echo "Unknown group: $GROUP. Skipping tests."
        ;;
esac

echo "Robotframework test suites for $GROUP have been successfully run."

# Keep the container running
# tail -f /dev/null

#!/bin/sh

echo "run.sh started."

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

# Check full boot
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
echo "Installing <APKName>.apk..."
# TODO 1: replace the <APKName> part with the correct name, then use(uncomment) the line below.
#		!Before you do this, check that you have done the TODO in Dockerfile
#adb -e install /opt/android-sdk/platform-tools/<APKName>.apk

# Run robot framework tests
echo "Calling RobotFramework test suites..."

# TODO 2: create the tests then use the correct paths to run/call them here
#mkdir /RF/results
#mkdir /RF/results/<TestName>
#robot -d results/<TestName> --timestampoutput /RF/robots/<TestName>.robot

echo "Robotframework test suites have been successfully run."

# Keep the container running
#tail -f /dev/null

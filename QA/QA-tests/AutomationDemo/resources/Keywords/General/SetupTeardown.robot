*** Settings ***
Library           Process
Library           AppiumLibrary
Resource          ../../../config/appium_config.robot
Resource          ../../Elements/Android/MainMenu.robot
Library           OperatingSystem

*** Keywords ***
Suite Setup
    Log    Suite setup
    Run Process    taskkill    /F    /IM    node.exe
    Start Process    appium    -a    ${APPIUM_SERVER_HOST}    -p    ${APPIUM_SERVER_PORT}    shell=True    alias=appiumserver    stdout=${CURDIR}/appium_stdout.txt    stderr=${CURDIR}/appium_stderr.txt

Suite Teardown
    #Suite tardown steps
    Log    Suite teardown
    Run Process    taskkill    /F    /IM    node.exe

Test Setup
    Log    ${CURDIR}
    Open Application    ${APPIUM_SERVER}    app=${ANDROID_APP}    deviceName=${DEVICE_NAME}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    appActivity=${APP_ACTIVITY}    autoGrantPermissions=true    noReset=true    newCommandTimeout=${COMMAND_TIMEOUT}
    Verify App Started

Test Teardown
    #Test tardown steps
    Log    Test teardown
    Capture Page Screenshot
    Log Source
    Close Application

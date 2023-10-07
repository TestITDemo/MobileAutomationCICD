*** Settings ***
Library           Process
Library           AppiumLibrary
Resource          ../../../config/appium_config.robot
Resource          ../../PageObjects/MainMenu.robot
Library           OperatingSystem

*** Keywords ***
Suite Setup
    Log    Suite setup
    Run Process    pkill    -f    node
    Start Process    appium    -a    ${APPIUM_SERVER_HOST}    -p    ${APPIUM_SERVER_PORT}    shell=True    alias=appiumserver    stdout=${CURDIR}/appium_stdout.txt    stderr=${CURDIR}/appium_stderr.txt

Suite Teardown
    Log    Suite teardown
    Run Process    pkill    -f    node

Test Setup
    Log    ${CURDIR}
    Open Application    ${APPIUM_SERVER}    appium:automationName=${appium:automationName}    appium:deviceName=${DEVICE_NAME}    appium:platformName=${PLATFORM_NAME}    appium:platformVersion=${PLATFORM_VERSION}    appium:appPackage= ${APP_PACKAGE}    appium:appActivity=${APP_ACTIVITY}    appium:autoGrantPermissions=true    appium:noReset=true    appium:newCommandTimeout=${COMMAND_TIMEOUT}    appium:forceAppLaunch=true    Verify App Started

Test Teardown
    Log    Test teardown
    Capture Page Screenshot
    Log Source
    Close Application

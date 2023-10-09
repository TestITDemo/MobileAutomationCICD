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
    Sleep    15s

Suite Teardown
    Log    Suite teardown
    Run Process    pkill    -f    node

Test Setup
    Open Application    ${APPIUM_SERVER}    appium:automationName=${appium:automationName}    appium:deviceName=${DEVICE_NAME}    appium:platformName=${PLATFORM_NAME}    appium:platformVersion=${PLATFORM_VERSION}    appium:appPackage= ${APP_PACKAGE}    appium:appActivity=${APP_ACTIVITY}    appium:autoGrantPermissions=true    appium:noReset=true    appium:newCommandTimeout=${COMMAND_TIMEOUT}    appium:forceAppLaunch=true
    Verify App Started

Test Teardown
    Log    Test teardown
    Capture Page Screenshot
    Log Source
    Close Application

Browser Setup
    Open Application    ${APPIUM_SERVER}    appium:automationName=${appium:automationName}    appium:deviceName=${DEVICE_NAME}    appium:platformName=${PLATFORM_NAME}    appium:platformVersion=${PLATFORM_VERSION}    appium:appPackage= com.android.chrome    appium:appActivity=org.chromium.chrome.browser.ChromeTabbedActivity    appium:autoGrantPermissions=true    appium:noReset=true    appium:newCommandTimeout=${COMMAND_TIMEOUT}    appium:forceAppLaunch=true
    Sleep    3s   # Give Chrome some time to open
    Go To Url   https://www.google.com
    Sleep   3s

Browser Teardown
    Close Application


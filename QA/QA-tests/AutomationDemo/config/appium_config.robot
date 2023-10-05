*** Settings ***
Library           AppiumLibrary

*** Variables ***
${APPIUM_SERVER_HOST}    localhost
${APPIUM_SERVER_PORT}    4723
${APPIUM_SERVER}    http://${APPIUM_SERVER_HOST}:${APPIUM_SERVER_PORT}
${PLATFORM_NAME}    android
${DEVICE_NAME}    emulator-5554
${APP_PACKAGE}    io.appium.android.apis
${APP_ACTIVITY}    .ApiDemos
${COMMAND_TIMEOUT}    200000
${ANDROID_APP}    ${CURDIR}/../resources/app/ApiDemos-debug.apk
${PLATFORM_VERSION}    11
${appium:automationName}    UiAutomator2

*** Keywords ***
Initialize Appium
    Open Application    http://localhost:4723/wd/hub    platformName=${PLATFORM_NAME}    platformVersion=${ANDROID_PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}

*** Settings ***
Suite Setup       Suite Setup
Suite Teardown    Suite Teardown
Resource          ../../config/appium_config.robot
Resource          ../../resources/Keywords/General/SetupTeardown.robot
Resource          ../../resources/PageObjects/MainMenu.robot

*** Test Cases ***
Capture Google Page Screenshot
    [Documentation]    Captures Google Page Screenshot
    [Tags]    Browser
    [Setup]    Browser Setup
    Log    Capturing screenshot of google page
    Capture Page Screenshot
    [Teardown]    Browser Teardown

*** Keywords ***

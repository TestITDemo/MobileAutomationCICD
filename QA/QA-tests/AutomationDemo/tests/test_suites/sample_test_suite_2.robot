*** Settings ***
Suite Setup       Suite Setup
Suite Teardown    Suite Teardown
Resource          ../../config/appium_config.robot
Resource          ../../resources/Keywords/General/SetupTeardown.robot
Resource          ../../resources/Elements/Android/MainMenu.robot

*** Test Cases ***
Verify App Launch2
    [Documentation]    Verifies that the app launches successfully.
    [Tags]    Smoke
    [Setup]    Test Setup
    Click Animation Button
    Capture Page Screenshot
    [Teardown]    Test Teardown

*** Keywords ***

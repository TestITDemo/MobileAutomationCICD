*** Settings ***
Suite Setup       Suite Setup
Suite Teardown    Suite Teardown
Resource          ../../config/appium_config.robot
Resource          ../../resources/Keywords/General/SetupTeardown.robot
Resource          ../../resources/PageObjects/MainMenu.robot
Resource          ../../resources/PageObjects/SubMenus/AppMenu.robot

*** Test Cases ***
Check List Dialog
    [Documentation]    Verifies that the app launches successfully.
    [Tags]    Smoke
    [Setup]    Test Setup
    Click App Button
    Capture Page Screenshot
    Open Alert Dialogs Menu

    [Teardown]    Test Teardown

*** Keywords ***

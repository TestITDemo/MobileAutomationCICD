*** Settings ***
Suite Setup       Suite Setup
Suite Teardown    Suite Teardown
Resource          ../../config/appium_config.robot
Resource          ../../resources/Keywords/General/SetupTeardown.robot
Resource          ../../resources/PageObjects/MainMenu.robot
Resource          ../../resources/PageObjects/SubMenus/AppMenu.robot
Resource          ../../resources/PageObjects/SubMenus/AlertDialogMenu.robot

*** Test Cases ***
Check List Dialog
    [Documentation]    Verifies that the List dialog items are displayed correctly
    [Tags]    Alerts
    [Setup]    Test Setup
    Click App Button
    Capture Page Screenshot
    Open Alert Dialogs Menu
    Open List Dialogs Modal
    Verify List Dialog Items
    [Teardown]    Test Teardown

*** Keywords ***

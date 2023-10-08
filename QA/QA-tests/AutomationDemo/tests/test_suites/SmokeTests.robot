*** Settings ***
Suite Setup       Suite Setup
Suite Teardown    Suite Teardown
Resource          ../../config/appium_config.robot
Resource          ../../resources/Keywords/General/SetupTeardown.robot
Resource          ../../resources/PageObjects/MainMenu.robot
Resource          ../../resources/PageObjects/SubMenus/AnimationMenu.robot

*** Test Cases ***
Verify Main Menu
    [Documentation]    Verifies main menu contains all of the desired items
    [Tags]    Smoke
    [Setup]    Test Setup
    Check Elements In Main Menu
    Capture Page Screenshot
    [Teardown]    Test Teardown

Verify Animation Menu
    [Documentation]    Verifies Animation menu contains all of the desired items
    [Tags]    Smoke
    [Setup]    Test Setup
    Open Animation Menu
    Check Elements In Animation Menu
    Capture Page Screenshot
    [Teardown]    Test Teardown

*** Keywords ***

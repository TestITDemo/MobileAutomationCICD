*** Settings ***
Resource          ../CommonResources.robot
Variables          Locators.py

*** Variables ***

*** Keywords ***
Open Animation Menu
    Click Element    ${MAIN_MENU['ANIMATION_BUTTON']}

Click App Button
    Click Element    ${MAIN_MENU['APP_BUTTON']}

Verify App Started
    Wait Until Page Contains Element    ${MAIN_MENU['ANIMATION_BUTTON']}    timeout=30s
    Page Should Contain Element    ${MAIN_MENU['ANIMATION_BUTTON']}
    Capture Page Screenshot

Check Elements In Main Menu
    Check Elements In Menu    ${MAIN_MENU}
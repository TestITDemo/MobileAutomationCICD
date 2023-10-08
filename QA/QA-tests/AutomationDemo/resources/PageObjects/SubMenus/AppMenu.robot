*** Settings ***
Resource          ../../CommonResources.robot
Variables          ../Locators.py

*** Keywords ***
Open Alert Dialogs Menu
    Click Element    ${APP_SUBMENU['ALERT_DIALOGS_BUTTON']}
    Wait Until Page Contains    App/Alert Dialogs
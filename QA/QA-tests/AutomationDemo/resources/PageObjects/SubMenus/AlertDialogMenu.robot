*** Settings ***
Resource          ../../CommonResources.robot
Variables          ../Locators.py

*** Keywords ***
Open List Dialogs Modal
    Click Element    ${ALERT_DIALOGS_SUBMENU['LIST_DIALOG_BUTTON']}
    Wait Until Page Contains    App/Alert Dialogs
    
Verify List Dialog Items
    Check Elements In Menu    ${LIST_DIALOG_MODAL}
    Capture Page Screenshot
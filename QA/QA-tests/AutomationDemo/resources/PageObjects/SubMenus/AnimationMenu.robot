*** Settings ***
Resource          ../../CommonResources.robot
Variables          ../Locators.py

*** Keywords ***
Check Elements In Animation Menu
    Check Elements In Menu    ${ANIMATION_SUBMENU}
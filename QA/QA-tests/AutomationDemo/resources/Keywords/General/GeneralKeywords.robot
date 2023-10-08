*** Settings ***
Resource          ../../CommonResources.robot
Library           Collections

*** Keywords ***
Check Elements In Menu
    [Arguments]  ${items}
    FOR  ${item}  IN  @{items}
       ${locator} =  Get From Dictionary  ${items}  ${item}
       ${is_visible} =  Run Keyword And Continue On Failure  Element Should Be Visible  ${locator}
       Run Keyword If  not ${is_visible}  Log  Menu item '${item}' is not visible.
    END

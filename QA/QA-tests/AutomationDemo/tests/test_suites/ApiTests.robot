*** Settings ***
Suite Setup       Suite Setup
Suite Teardown    Suite Teardown
Resource          ../../config/appium_config.robot
Resource          ../../resources/Keywords/General/SetupTeardown.robot
Resource          ../../resources/PageObjects/MainMenu.robot
Library           RequestsLibrary

*** Test Cases ***
Check API Availability
    [Documentation]    Check API Availability
    [Tags]    API
    ${baseUrl}      Set Variable    https://dummyjson.com
    ${endpint}      Set Variable    /products/1
    Create Session    dummyJson    ${baseUrl}
    ${response} =    GET On Session    dummyJson    ${endpint}    expected_status=200
    # Verify the status code is 200 (OK)
    Should Be Equal As Strings    ${response.status_code}    200

*** Keywords ***

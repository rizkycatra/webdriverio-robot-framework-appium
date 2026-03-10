*** Settings ***
Resource    screen_objects/form_keywords.resource
Suite Setup    Setup Appium Session
Test Setup    Setup Form Test Environtment
Test Teardown    User Terminate Application
Suite Teardown    Close Application

*** Test Cases ***
Verify Input Text Field Reflects In Output Label
    ${text}=    User Input Text On Input Field Form    Test Input #$123
    User Verify The Output Text    ${text}

Verify Switch Toggle Function Reflects In Output Text
    User Switch The Toggle Button To State    true
    User Switch The Toggle Button To State    false
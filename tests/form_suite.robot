*** Settings ***
Resource            screen_objects/form_keywords.resource

Suite Setup         Setup Appium Session
Suite Teardown      Close Application
Test Setup          Setup Form Test Environment
Test Teardown       User Terminate Application


*** Test Cases ***
Verify Input Text Field Reflects In Output Label
    ${text}=    User Input Text On Input Field Form    Test Input #$123
    User Verify The Output Text    ${text}

Verify Switch Toggle Function Reflects In Output Text
    User Switch The Toggle Button To State    true
    User Switch The Toggle Button To State    false

Verify Select Dropdown Options
    User Choose The Option From Dropdown And Verify The Option Output    3

Verify The Active Buttons Functionality
    User Click The Active Buttons

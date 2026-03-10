*** Settings ***
Library    AppiumLibrary
Resource    common_keywords.resource
Variables    variables/variables.py


*** Keywords ***
User Signup With Credentials
    [Arguments]    ${email}    ${password}
    Click Element    xpath=//android.widget.TextView[@text="Sign up"]
    Input Text    accessibility_id=input-email    ${email}
    Input Password    accessibility_id=input-password    ${password}
    Input Password    accessibility_id=input-repeat-password    ${password}
    Click Element    accessibility_id=button-SIGN UP
    Wait Until Page Contains   You successfully signed up!    timeout=${TIMEOUT}
    Click Element    id=android:id/button1

User Signup With Invalid Credentials
    [Arguments]    ${email}    ${password_1}    ${password_2}    ${email_error}    ${password_1_error}    ${password_2_error}
    Click Element    xpath=//android.widget.TextView[@text="Sign up"]
    Input Text    accessibility_id=input-email    ${email}
    Input Password    accessibility_id=input-password    ${password_1}
    Input Password    accessibility_id=input-repeat-password    ${password_2}
    Click Element    accessibility_id=button-SIGN UP
    Element Should Contain Text    xpath=//android.widget.TextView[@text="${email_error}"]    ${email_error}
    Element Should Contain Text    xpath=//android.widget.TextView[@text="${password_1_error}"]   ${password_1_error}
    Element Should Contain Text    xpath=//android.widget.TextView[@text="${password_2_error}"]   ${password_2_error}



*** Settings ***
Library    AppiumLibrary
Resource    common_keywords.resource
Variables    variables/variables.py


*** Keywords ***
Setup Login Test Environtment
    Open WebdriverIO Demo Application
    User Open Menu    Login

User Login With Credentials
    [Arguments]    ${email}    ${password}
    Input Text    accessibility_id=input-email    ${email}
    Input Password    accessibility_id=input-password    ${password}
    Click Element    accessibility_id=button-LOGIN
    Wait Until Page Contains    You are logged in!    timeout=${TIMEOUT}
    Click Element    id=android:id/button1

Login With Invalid Credentials
    [Arguments]    ${email}    ${password}    ${email_error}    ${password_error}
    Input Text    accessibility_id=input-email    ${email}
    Input Password    accessibility_id=input-password    ${password}
    Click Element    accessibility_id=button-LOGIN
    Element Should Contain Text    xpath=//android.widget.TextView[@text="${email_error}"]    ${email_error}
    Element Should Contain Text    xpath=//android.widget.TextView[@text="${password_error}"]   ${password_error}



    

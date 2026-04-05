*** Settings ***
Resource            screen_objects/login_keywords.resource

Suite Setup         Setup Appium Session
Suite Teardown      Close Application
Test Setup          Setup Login Test Environtment
Test Teardown       User Terminate Application


*** Test Cases ***
Login With Valid Credentials
    User Login With Credentials    ${DEFAULT_USER}    ${DEFAULT_PASS}

Login With Invalid Credentials
    [Template]    Login With Invalid Credentials
    # EMAIL    PASSWORD    EMAIL_ERROR    PASSWORD_ERROR
    rizkytest    ${DEFAULT_PASS}    Please enter a valid email address    ${EMPTY}
    ${DEFAULT_USER}    invalid    ${EMPTY}    Please enter at least 8 characters
    rizkytest    invalid    Please enter a valid email address    Please enter at least 8 characters
    ${EMPTY}    ${DEFAULT_PASS}    Please enter a valid email address    ${EMPTY}
    ${DEFAULT_USER}    ${EMPTY}    ${EMPTY}    Please enter at least 8 characters
    ${EMPTY}    ${EMPTY}    Please enter a valid email address    Please enter at least 8 characters

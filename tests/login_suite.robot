*** Settings ***
Resource    screen_objects/login_keywords.resource
Suite Setup    Setup Appium Session
Test Setup    Setup Login Test Environtment
Test Teardown    User Terminate Application
Suite Teardown    Close Application



*** Test Cases ***
Login With Valid Credentials
    User Login With Credentials    rizkytest@gmail.com    zsxszswwewex

Login With Invalid Credentials
    [Template]    Login With Invalid Credentials
    #EMAIL    PASSWORD    ERROR
    rizkytest    validpassword    Please enter a valid email address    ${EMPTY}
    rizkytest@gmail.com    invld    ${EMPTY}    Please enter at least 8 characters
    rizkytest    sadas    Please enter a valid email address    Please enter at least 8 characters
    ${EMPTY}    validpassword    Please enter a valid email address    ${EMPTY}
    rizkytest@gmail.com    ${EMPTY}    ${EMPTY}    Please enter at least 8 characters
    ${EMPTY}    ${EMPTY}    Please enter a valid email address    Please enter at least 8 characters
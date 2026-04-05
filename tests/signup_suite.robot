*** Settings ***
Resource            screen_objects/signup_keywords.resource
Resource            screen_objects/login_keywords.resource

Suite Setup         Setup Appium Session
Suite Teardown      Close Application
Test Setup          Setup Login Test Environtment
Test Teardown       User Terminate Application


*** Test Cases ***
Signup With Valid Credentials
    User Signup With Credentials

Signup With Invalid Credentials
    [Template]    User Signup With Invalid Credentials
    # Email    Password_1    Password_2    Email_error    Password_1_error    Password_2_error
    rizkytest@gmail.com    invld    invld2    ${EMPTY}    Please enter at least 8 characters    Please enter the same password
    rizkytest@gmail.com    validpassword    invld2    ${EMPTY}    ${EMPTY}    Please enter the same password
    rizkytest    validpassword    validpassword    Please enter a valid email address    ${EMPTY}    ${EMPTY}
    rizkytest    validpassword    invld    Please enter a valid email address    ${EMPTY}    Please enter the same password
    rizkytest    invld    invld    Please enter a valid email address    Please enter at least 8 characters    Please enter the same password
    ${EMPTY}    validpassword    validpassword    Please enter a valid email address    ${EMPTY}    ${EMPTY}
    rizkytest@gmail.com    ${EMPTY}    validpassword    ${EMPTY}    Please enter at least 8 characters    Please enter the same password
    rizkytest@gmail.com    ${EMPTY}    ${EMPTY}    ${EMPTY}    Please enter at least 8 characters    Please enter the same password
    ${EMPTY}    ${EMPTY}    ${EMPTY}    Please enter a valid email address    Please enter at least 8 characters    Please enter the same password

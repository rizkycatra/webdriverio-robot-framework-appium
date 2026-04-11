*** Settings ***
Resource            screen_objects/permission_keywords.resource

Suite Setup         Setup Appium Session
Suite Teardown      Close Application
Test Setup          Setup Side Menu Test Environment
Test Teardown       User Terminate Application


*** Test Cases ***
Allow Camera Permission
    User Set The Camera Permission To Active

Allow Microphone Permission
    User Set The Microphone Permission To Active

Allow Location Permission
    User Set The Location Permission To Active

Allow Photos Permission
    User Set The Photos Permission To Active

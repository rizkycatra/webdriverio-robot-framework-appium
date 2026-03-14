*** Settings ***
Resource    screen_objects/swipe_keywords.resource
Suite Setup    Setup Appium Session
Test Setup    Setup Swipe Test Environtment
Test Teardown    User Terminate Application
Suite Teardown    Close Application

*** Test Cases ***
Verify Horizontal Swap Gesture
    User Swipe The Screen From Rigth To Left    4
    User Swipe The Screen From Left To Right    4

Verify Vertical Swap Gesture
    User Swipe Up The Screen And Verify The Content
    User Swipe Down The Screen And Verify The Content
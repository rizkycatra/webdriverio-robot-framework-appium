*** Settings ***
Resource            screen_objects/swipe_keywords.resource

Suite Setup         Setup Appium Session
Suite Teardown      Close Application
Test Setup          Setup Swipe Test Environment
Test Teardown       User Terminate Application


*** Test Cases ***
Verify Horizontal Swap Gesture
    User Swipe The Screen From Right To Left
    User Swipe The Screen From Left To Right

Verify Vertical Swap Gesture
    User Swipe Up The Screen And Verify The Content
    User Swipe Down The Screen And Verify The Content

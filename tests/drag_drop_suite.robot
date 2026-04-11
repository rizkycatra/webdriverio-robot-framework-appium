*** Settings ***
Resource            screen_objects/drag_drop_keywords.resource

Suite Setup         Setup Appium Session
Suite Teardown      Close Application
Test Setup          Setup Drag And Drop Test Environment
Test Teardown       User Terminate Application


*** Test Cases ***
Verify Drag And Drop Functionality
    User Completing The Robot Puzzle

Verify Reset Puzzle Functionality
    User Reset The Puzzle

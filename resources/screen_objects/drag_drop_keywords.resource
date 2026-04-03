*** Settings ***
Library         AppiumLibrary
Resource        common_keywords.resource
Variables       variables/variables.py


*** Keywords ***
Setup Drag And Drop Test Environtment
    Open WebdriverIO Demo Application
    User Open Menu    Drag

User Completing The Robot Puzzle
    Drag And Drop    accessibility_id=drag-l1    accessibility_id=drop-l1
    Drag And Drop    accessibility_id=drag-c1    accessibility_id=drop-c1
    Drag And Drop    accessibility_id=drag-r1    accessibility_id=drop-r1
    Drag And Drop    accessibility_id=drag-l2    accessibility_id=drop-l2
    Drag And Drop    accessibility_id=drag-c2    accessibility_id=drop-c2
    Drag And Drop    accessibility_id=drag-r2    accessibility_id=drop-r2
    Drag And Drop    accessibility_id=drag-l3    accessibility_id=drop-l3
    Drag And Drop    accessibility_id=drag-c3    accessibility_id=drop-c3
    Drag And Drop    accessibility_id=drag-r3    accessibility_id=drop-r3
    Wait Until Page Contains    Congratulations    timeout=${TIMEOUT}
    Click Element    accessibility_id=button-Retry
    Wait Until Element Is Visible    accessibility_id=Drag-drop-screen

User Reset The Puzzle
    Drag And Drop    accessibility_id=drag-l1    accessibility_id=drop-l1
    Drag And Drop    accessibility_id=drag-c1    accessibility_id=drop-c1
    Drag And Drop    accessibility_id=drag-r1    accessibility_id=drop-r1
    Click Element    accessibility_id=renew
    Page Should Contain Element    accessibility_id=drag-l1
    Page Should Contain Element    accessibility_id=drag-c1
    Page Should Contain Element    accessibility_id=drag-r1

*** Settings ***
Library    AppiumLibrary
Resource    common_keywords.resource
Variables    variables/variables.py

*** Keywords ***
Setup Swipe Test Environtment
    Open WebdriverIO Demo Application
    User Open Menu    Swipe

User Swipe The Screen From Rigth To Left
    [Arguments]    ${swipe_attempt}
    FOR    ${i}    IN RANGE    ${swipe_attempt}
        Swipe   start_x=767    start_y=1458    end_x=49    end_y=1458    duration=${SWIPE_DURATION}
    END

User Swipe The Screen From Left To Right
    [Arguments]    ${swipe_attempt}
    FOR    ${i}    IN RANGE    ${swipe_attempt}
        Swipe   start_x=49    start_y=1458    end_x=767    end_y=1458    duration=${SWIPE_DURATION}
    END

User Swipe Up The Screen And Verify The Content
    Swipe    start_x=540    start_y=2013    end_x=540    end_y=468    duration=${SWIPE_DURATION}
    Sleep    2s
    Page Should Contain Text    You found me!!!

User Swipe Down The Screen And Verify The Content
    Swipe    start_x=540    start_y=468    end_x=540    end_y=2013    duration=${SWIPE_DURATION}
    Sleep    2s
    Page Should Contain Text    Swipe horizontal
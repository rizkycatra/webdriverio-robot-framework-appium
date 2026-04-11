*** Settings ***
Library         AppiumLibrary
Resource        common_keywords.resource
Variables       variables/variables.py


*** Keywords ***
Setup Swipe Test Environment
    Open WebdriverIO Demo Application
    User Open Menu    Swipe

User Swipe The Screen From Right To Left
    FOR    ${i}    IN RANGE    5
        Swipe By Percent    start_x=90    start_y=75    end_x=10    end_y=75    duration=${SWIPE_DURATION}
    END
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="COMPATIBLE"]    timeout=${TIMEOUT}

User Swipe The Screen From Left To Right
    FOR    ${i}    IN RANGE    5
        Swipe By Percent    start_x=10    start_y=75    end_x=90    end_y=75    duration=${SWIPE_DURATION}
    END
    Wait Until Element Is Visible    //android.widget.TextView[@text="FULLY OPEN SOURCE"]    timeout=${TIMEOUT}

User Swipe Up The Screen And Verify The Content
    Swipe    start_x=540    start_y=2013    end_x=540    end_y=468    duration=${SWIPE_DURATION}
    Sleep    2s
    Page Should Contain Text    You found me!!!

User Swipe Down The Screen And Verify The Content
    Swipe    start_x=540    start_y=468    end_x=540    end_y=2013    duration=${SWIPE_DURATION}
    Sleep    2s
    Page Should Contain Text    Swipe horizontal

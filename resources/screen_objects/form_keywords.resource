*** Settings ***
Library    AppiumLibrary
Resource    common_keywords.resource

*** Keywords ***
Setup Form Test Environtment
    Open WebdriverIO Demo Application
    User Open Menu    Forms

#Input Field
User Input Text On Input Field Form
    [Arguments]    ${text}
    Input Text    accessibility_id=text-input    ${text}
    RETURN    ${text}

User Verify The Output Text
    [Arguments]    ${text}
    Element Should Contain Text    accessibility_id=input-text-result    ${text}

User Switch The Toggle Button To State
    [Arguments]    ${switch_state}
    ${switch_status}=    Get Element Attribute    accessibility_id=switch    checked
    IF    '${switch_status}'!='${switch_state}'
        Click Element    accessibility_id=switch
    END
    ${expected_text}=    Set Variable If    '${switch_state}'=='true'    Click to turn the switch OFF    Click to turn the switch ON
    Element Attribute Should Match    accessibility_id=switch    checked    ${switch_state}
    Element Text Should Be    accessibility_id=switch-text    ${expected_text}


    
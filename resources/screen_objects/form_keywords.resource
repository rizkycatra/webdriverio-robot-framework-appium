*** Settings ***
Library         AppiumLibrary
Resource        common_keywords.resource
Variables       variables/variables.py


*** Keywords ***
Setup Form Test Environment
    Open WebdriverIO Demo Application
    User Open Menu    Forms

# Input Field Keywords

User Input Text On Input Field Form
    [Arguments]    ${text}
    Input Text    accessibility_id=text-input    ${text}
    RETURN    ${text}

User Verify The Output Text
    [Arguments]    ${text}
    Element Should Contain Text    accessibility_id=input-text-result    ${text}

# Switch Toggle Keywords

User Switch The Toggle Button To State
    [Arguments]    ${switch_state}
    ${switch_status}=    Get Element Attribute    accessibility_id=switch    checked
    IF    '${switch_status}'!='${switch_state}'
        Click Element    accessibility_id=switch
    END
    ${expected_text}=    Set Variable If
    ...    '${switch_state}'=='true'
    ...    Click to turn the switch OFF
    ...    Click to turn the switch ON
    Element Attribute Should Match    accessibility_id=switch    checked    ${switch_state}
    Element Text Should Be    accessibility_id=switch-text    ${expected_text}

# Dropdown Keywords

User Choose The Option From Dropdown And Verify The Option Output
    [Arguments]    ${option}
    ${text}=    Set Variable If
    ...    ${option}==1    webdriver.io is awesome
    ...    ${option}==2    Appium is awesome
    ...    ${option}==3    This app is awesome

    ${locator}=    Set Variable
    ...    xpath=//android.widget.CheckedTextView[@resource-id="android:id/text1" and @text="${text}"]

    Click Element    xpath=//android.widget.EditText[@resource-id="text_input"]
    Wait Until Element Is Visible    id=com.wdiodemoapp:id/select_dialog_listview    timeout=${TIMEOUT}

    Click Element    ${locator}
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@resource-id="text_input"]    ${TIMEOUT}
    Element Should Contain Text    xpath=//android.widget.EditText[@resource-id="text_input"]    ${text}

User Click The Active Buttons
    Click Element    accessibility_id=button-Active
    Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout    timeout=${TIMEOUT}
    Click Element    id=android:id/button1

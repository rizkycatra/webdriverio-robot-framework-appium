*** Settings ***
Library         AppiumLibrary
Resource        common_keywords.resource
Variables       variables/variables.py


*** Keywords ***
Setup Side Menu Test Environment
    Open WebdriverIO Demo Application
    User Open Menu    Menu
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Menu"]    timeout=${TIMEOUT}
    User Open Side Menu    Permissions
    Wait Until Page Contains    Permissions

User Set The Camera Permission To Active
    Click Element    accessibility_id=permission-switch-camera
    Wait Until Page Contains Element    id=com.android.permissioncontroller:id/grant_dialog    timeout=${TIMEOUT}
    Click Element    id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
    Wait Until Page Contains    Permissions    timeout=${TIMEOUT}
    Element Attribute Should Match    accessibility_id=permission-switch-camera    checked    true

User Set The Microphone Permission To Active
    Click Element    accessibility_id=permission-switch-microphone
    Wait Until Page Contains Element    id=com.android.permissioncontroller:id/grant_dialog    timeout=${TIMEOUT}
    Click Element    id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
    Wait Until Page Contains    Permissions    timeout=${TIMEOUT}
    Element Attribute Should Match    accessibility_id=permission-switch-microphone    checked    true

User Set The Location Permission To Active
    Click Element    accessibility_id=permission-switch-location
    Wait Until Page Contains Element    id=com.android.permissioncontroller:id/grant_dialog    timeout=${TIMEOUT}
    Click Element    id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
    Wait Until Page Contains    Permissions    timeout=${TIMEOUT}
    Element Attribute Should Match    accessibility_id=permission-switch-location    checked    true

User Set The Photos Permission To Active
    Click Element    accessibility_id=permission-switch-photos
    Wait Until Page Contains Element    id=com.android.permissioncontroller:id/grant_dialog    timeout=${TIMEOUT}
    Click Element    id=com.android.permissioncontroller:id/permission_allow_button
    Wait Until Page Contains Element    id=com.android.permissioncontroller:id/grant_dialog    timeout=${TIMEOUT}
    Click Element    id=com.android.permissioncontroller:id/permission_allow_all_button
    Wait Until Page Contains    Permissions    timeout=${TIMEOUT}
    Element Attribute Should Match    accessibility_id=permission-switch-photos    checked    true

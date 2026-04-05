*** Settings ***
Library         AppiumLibrary
Variables       ../variables/capabilities.py


*** Keywords ***
Setup Appium Session
    Open Application    ${REMOTE_URL}
    ...    automationName=${AUTOMATION_NAME}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${APP_PATH}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    noReset=true
    ...    fullReset=false

Open WebdriverIO Demo Application
    Activate Application    ${APP_PACKAGE}

User Open Menu
    [Arguments]    ${menu}
    Click Element    accessibility_id=${menu}

User Terminate Application
    [Documentation]    Kills the app process to reset state for the next test.
    Terminate Application    ${APP_PACKAGE}

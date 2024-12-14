*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    Collections
Library    String
Test Setup    open the browser with Mortgage payment url
Test Teardown    Close Browser Session
Resource    resource.robot


*** Variables ***
${Error_message_login}    css:.alert-danger
${Shop_page_load}    css:.nav-link
#this way you can save variables at global level so that they can be used globally in a framework

*** Test Cases ***
Validate child window functionality
    Click link to open child window
    Verify that user has switched to child window
    Get email on the child window
    Switch to parent window and enter the email



*** Keywords ***
Click link to open child window
    Click Element    css:.blinkingText
    Sleep    5

Verify that user has switched to child window
    Switch Window    NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST

Get email on the child window
    ${WholeText}=    Get Text    css:.red
    @{SplitString1}=    Split String    ${WholeText}    at
    ${SplitText1}=    Get From List    ${SplitString1}    1
    Log    ${SplitText1}
    @{SplitString2}=    Split String    ${SplitText1}
    ${email}=    Get From List    ${SplitString2}    0
    Set Global Variable    ${email}
    Log    ${email}

Switch to parent window and enter the email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}
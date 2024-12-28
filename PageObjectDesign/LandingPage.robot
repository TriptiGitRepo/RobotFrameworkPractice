*** Settings ***
Documentation    This contains all the page objects and keywords of the landing page
Library    SeleniumLibrary
Resource    Generic.robot

*** Variables ***
${Error_message_login}    css:.alert-danger


*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    signInBtn

Wait until element is located on the page
    Wait until element passed is located on page    ${Error_message_login}

verify error message is correct
    ${result}=    Get Text    ${Error_message_login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
#    Another way
#    Element Text Should Be    ${Error_message_login}    Incorrect username/password.

Fill the login details and choose user types
    Input Text    id:username    rahulshettyacademy
    Input Password    id:password    learning
    Click Element    css:input[value='user']
    Wait Until Element Is Visible    css:.modal-body
    Click Button    okayBtn
    Click Button    okayBtn
    Wait Until Element Is Not Visible    css:.modal-body
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    id:terms
    Checkbox Should Be Selected    id:terms
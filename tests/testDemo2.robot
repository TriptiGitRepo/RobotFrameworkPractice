*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Test Setup        open the browser with Mortgage payment url
Test Teardown    Close Browser Session
Resource    resource.robot


*** Variables ***
${Error_message_login}    css:.alert-danger
#this way you can save variables at global level so that they can be used globally in a framework

*** Test Cases ***
Validate Successful Login
        Fill the login form
        wait until it checks and displays error message
        verify error message is correct

*** Keywords ***
Fill the login form
    Input Text    id:username    ${user_name}
    Input Password    id:password    ${invalid_password}
    Click Button    signInBtn
    
wait until it checks and displays error message
    Wait Until Element Is Visible    css:.alert-danger

verify error message is correct
    ${result}=    Get Text    ${Error_message_login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
#    Another way
#    Element Text Should Be    ${Error_message_login}    Incorrect username/password.
    
*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Test Setup        open the browser with Mortgage payment url
Test Teardown    Close Browser Session
Resource    resource.robot


*** Variables ***
${Error_message_login}    css:.alert-danger
${Shop_page_load}    css:.nav-link
#this way you can save variables at global level so that they can be used globally in a framework

*** Test Cases ***
Validate Successful Login
        Fill the login form    ${user_name}    ${invalid_password}
        wait until element is located on the page    ${Error_message_login}
        verify error message is correct

Validate Cards displayed in the shopping page
    Fill The Login Form    ${user_name}    ${valid_password}
    wait until element is located on the page    ${Shop_page_load}

*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    signInBtn
    
wait until element is located on the page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

verify error message is correct
    ${result}=    Get Text    ${Error_message_login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
#    Another way
#    Element Text Should Be    ${Error_message_login}    Incorrect username/password.
    
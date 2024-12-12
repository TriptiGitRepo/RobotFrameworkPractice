*** Settings ***
Documentation    To validate the login form

Library    SeleniumLibrary

*** Test Cases ***
Validate Successful Login
        open the browser with Mortgage payment url
        Fill the login form
        wait until it checks and displays error message
        verify error message is correct

*** Keywords ***
open the browser with Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    Input Text    id:username    rahulshettyacademy
    Input Password    id:password    12345678
    Click Button    signInBtn
    
wait until it checks and displays error message
    Wait Until Element Is Visible    css:.alert-danger

verify error message is correct
    ${result}=    Get Text    css:.alert-danger
    Should Be Equal As Strings    ${result}    Incorrect username/password.
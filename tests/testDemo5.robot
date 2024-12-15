*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    DataDriver    file=resources/data.csv    encoding=utf_8    dialect=unix
Test Teardown    Close Browser
Test Template    Validate Successful Login

*** Variables ***
${Error_message_login}    css:.alert-danger
#this way you can save variables at global level so that they can be used globally in a framework

*** Test Cases ***
Login with userid ${user_name} and password ${password}    xyz    123456


*** Keywords ***
Validate Successful Login
    [Arguments]    ${user_name}    ${password}
    open the browser with Mortgage payment url
    Fill the login form    ${user_name}    ${password}
    wait until it checks and displays error message
    verify error message is correct
        
open the browser with Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    [Arguments]    ${user_name}    ${password}
    Input Text    id:username    ${user_name}
    Input Password    id:password    ${password}
    Click Button    signInBtn
    
wait until it checks and displays error message
    Wait Until Element Is Visible    css:.alert-danger

verify error message is correct
    ${result}=    Get Text    ${Error_message_login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
#    Another way
#    Element Text Should Be    ${Error_message_login}    Incorrect username/password.
#    Log    end of execution
#    Capture Page Screenshot    TestScreenshot-{index}.png
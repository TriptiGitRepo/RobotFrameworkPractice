*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
#Test Teardown    Close Browser
Test Template    Validate Successful Login

*** Variables ***
${Error_message_login}    css:.alert-danger
#this way you can save variables at global level so that they can be used globally in a framework

*** Test Cases ***    username    password
Invalid username        dsahed    learning
Invalid password        rahulshetty    psjfrhf
special characters        @#$    learning


*** Keywords ***
Validate Successful Login
    [Arguments]    ${username}    ${password}
    open the browser with Mortgage payment url
    Fill the login form    ${username}    ${password}
    wait until it checks and displays error message
    verify error message is correct
        
open the browser with Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    signInBtn
    
wait until it checks and displays error message
    Wait Until Element Is Visible    css:.alert-danger

verify error message is correct
    ${result}=    Get Text    ${Error_message_login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
#    Another way
#    Element Text Should Be    ${Error_message_login}    Incorrect username/password.
    Log    end of execution
    Capture Page Screenshot    TestScreenshot-{index}.png
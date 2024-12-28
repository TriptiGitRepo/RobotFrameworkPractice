*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...
...    The system specific keywords are created here from our own
...    domain specific language. They utilize keywords provided
...    by the impost SeleniumLibrary.
Library    SeleniumLibrary

*** Variables ***
${user_name}    rahulshettyacademy
${invalid_password}    12345678
${valid_password}    learning
${url}    https://rahulshettyacademy.com/loginpagePractise/
${Error_message_login}    css:.alert-danger

*** Keywords ***
open the browser with Mortgage payment url
    Create Webdriver    Chrome
    Go To    ${url}
    
Close Browser Session
    Close Browser

Wait until element passed is located on page
    [Arguments]    ${page_locator}
    Wait Until Element Is Visible    ${page_locator}
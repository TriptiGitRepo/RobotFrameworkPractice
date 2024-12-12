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
${url}    https://rahulshettyacademy.com/loginpagePractise/
*** Keywords ***
open the browser with Mortgage payment url
    Create Webdriver    Chrome
    Go To    ${url}
    
Close Browser Session
    Close Browser
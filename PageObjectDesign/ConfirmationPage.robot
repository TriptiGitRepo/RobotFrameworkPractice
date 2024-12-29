*** Settings ***
Documentation    This contains all the page objects and keywords of the landing page
Library    SeleniumLibrary
Library    Collections
Resource    Generic.robot

*** Variables ***


*** Keywords ***
Enter country
    [Arguments]    ${country_name}
    Input Text    country    ${country_name}
    Wait Until Element Passed Is Located On Page    //a[text()='${country_name}']
    Sleep    3
    Click Element    //a[text()='${country_name}']
    Click Element    css:.checkbox label

Purchase order and confirm the purchase message
    Click Button    css:.btn-success
    Page Should Contain    Success
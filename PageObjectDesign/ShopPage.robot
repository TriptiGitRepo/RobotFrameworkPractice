*** Settings ***
Documentation    This contains all the page objects and keywords of the landing page
Library    SeleniumLibrary
Library    Collections
Resource    Generic.robot

*** Variables ***
${Shop_page_load}    css:.nav-link

*** Keywords ***
Wait until element is located on the page
    Wait until element passed is located on page    ${Shop_page_load}

Verify item titles on the shopping page
    @{expectedList}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements}=    Get Webelements    css:.card-title
    @{actualList}=    Create List
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List    ${actualList}    ${element.text}
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}

Select and add item to cart
    [Arguments]    ${item_name}
    ${elements}=    Get Webelements    css:.card-title
    ${index}=    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${item_name}' == '${element.text}'
        ${index}=    Evaluate    ${index} + 1
    END
    Click Button    xpath:(//button[contains(@class, 'btn')])[${index}]
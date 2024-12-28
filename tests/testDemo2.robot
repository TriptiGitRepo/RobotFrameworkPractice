*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    Collections
Test Setup        open the browser with Mortgage payment url
Test Teardown    Close Browser Session
Resource    ../PageObjectDesign/Generic.robot


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
    Fill the login form    ${user_name}    ${valid_password}
    Wait until element is located on the page    ${Shop_page_load}
    Verify item titles on the shopping page
    Select and add item to cart    Blackberry

Select the form and navigate to child window
     Fill the login details and choose user types



*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    signInBtn
    
Wait until element is located on the page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

verify error message is correct
    ${result}=    Get Text    ${Error_message_login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
#    Another way
#    Element Text Should Be    ${Error_message_login}    Incorrect username/password.

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
    
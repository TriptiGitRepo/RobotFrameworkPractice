*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    Collections
Library    ../customLibraries/Shop.py
Test Setup        open the browser with Mortgage payment url
Test Teardown    Close Browser Session
Resource    ../PageObjectDesign/Generic.robot
Resource    ../PageObjectDesign/LandingPage.robot
Resource    ../PageObjectDesign/ShopPage.robot

*** Variables ***
@{listofProducts}    Blackberry    Nokia Edge
#this way you can save variables at global level so that they can be used globally in a framework

*** Test Cases ***
Validate Successful Login
        LandingPage.Fill the login form    ${user_name}    ${invalid_password}
        LandingPage.wait until element is located on the page
        LandingPage.verify error message is correct

Validate Cards displayed in the shopping page
    LandingPage.Fill the login form    ${user_name}    ${valid_password}
    ShopPage.Wait until element is located on the page
    ShopPage.Verify item titles on the shopping page
#    ShopPage.Select and add item to cart    Blackberry
    Add Item To Cart And Checkout    ${listofProducts}

Select the form and navigate to child window
     LandingPage.Fill the login details and choose user types
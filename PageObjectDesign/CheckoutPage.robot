*** Settings ***
Documentation    This contains all the page objects and keywords of the landing page
Library    SeleniumLibrary
Library    Collections
Resource    Generic.robot

*** Variables ***


*** Keywords ***
Verify items on checkout page and proceed
    Click Element    css:td .btn-success
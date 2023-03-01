*** Settings ***
Documentation                   Exploring Dialogs Library
Library                         Dialogs
Resource                        ../Resources/Web/Common.robot
Resource                        ../Resources/Web/AmazonApp.robot
Test Setup                      Common.Begin Web Test
Test Teardown                   Common.End Web Test

*** Variables ***
${BROWSER} =  safari
${START_URL} =  https://www.amazon.com
${SEARCH_TEXT} =  Ferrari 458

*** Test Cases ***
Logged out user can search for products
    [Tags]  Web
    ${new_browser} =  Get Selection From User  Which browser?  chrome  ie  safari
    Set Global Variable  ${BROWSER}  ${new_browser}
    AmazonApp.Search for Products

Logged out user can add product to cart
    [Tags]  Web
    AmazonApp.Search for Products
    Execute Manual Step  Do something manually!  It failed!
    AmazonApp.Select Product from Search Results
    Pause Execution
    AmazonApp.Add Product to Cart
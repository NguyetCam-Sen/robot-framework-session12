*** Settings ***
Library                             SeleniumLibrary

*** Keywords ***
Verify Page Loaded
    wait until page contains        Back to search results

Add To Cart
    click button                    id=add-to-cart-button
*** Settings ***
Library                             SeleniumLibrary

*** Keywords ***
Load Start Page
    go to                           ${START_URL}

Verify Page Loaded
    wait until page contains        Sell
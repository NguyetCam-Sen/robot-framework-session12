*** Settings ***
Library                             SeleniumLibrary

*** Keywords ***
Verify Search Completed
    wait until page contains        results for "${SEARCH_TEXT}"

Click Product Link
    [Documentation]                 Click on the First Product in the Search Result List
    click link                      xpath=//*[@id="search"]/div[1]/div[1]/div/span[1]/div[1]/div[2]/div/div/div/div/div/div[2]/div/div/div[1]/h2/a
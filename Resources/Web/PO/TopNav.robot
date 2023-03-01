*** Settings ***
Library                             SeleniumLibrary

*** Keywords ***
Search for Products
    Input Search Text
    Submit Search

Input Search Text
    input text                      id=twotabsearchtextbox      ${SEARCH_TEXT}

Submit Search
    click button                    id=nav-search-submit-button
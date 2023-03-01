*** Settings ***
Library                         SeleniumLibrary

*** Keywords ***
Begin Web Test
    open browser                about:blank     ${BROWSER}

End Web Test
    close all browsers
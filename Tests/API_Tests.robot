*** Settings ***
Documentation                           These Tests are about RequestsLibrary Keywords Calling an API

Resource                                ../Resources/API/Github.robot

*** Test Cases ***
Make a Simple REST API Call
    [Tags]                              API
    Github.Check Github Username

Display Emoji from Github
    [Tags]                              API
    Github.Display Emoji
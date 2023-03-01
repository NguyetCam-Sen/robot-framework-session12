*** Settings ***
Documentation                   Some Examples of the Built In Library
Library                         SeleniumLibrary

*** Variables ***
${GLOBAL_1}                     This is a global variable
${SOME_GLOBAL_DATA}

*** Keywords ***
Say Something
    Log                         Hello World!

*** Test Cases ***
Declare and Set Variables
    ${some_test_data}           Set Variable            This variable is only available within this test
    Set Test Variable           ${more_test_data}       This variable is also only available within this test

    # Variables that are available in all test cases in the current set suite
    Set Suite Variable          ${some_suite_data}       This variable is available in all tests in this suite

    # Variables that are available in all test cases in all suites
    Set Global Variable         ${SOME_GLOBAL_DATA}     This variable is available in everywhere

Logging Stuff
    [Tags]                      BuiltIn
    Comment                     ${unset_variable}
    Comment                     Some random comment
    Comment                     ${GLOBAL_1}

    Log                         This is single log
    Log Many                    This is the first log in many logs      This is the second log      This is the third log
    Log To Console              This is shown only in console
    Log Variables               # This keyword shows all the current variables
    Log Many                    ${some_suite_data}      ${SOME_GLOBAL_DATA}     ${GLOBAL_1}

Ignore Failures in This Test
    [Tags]                      BuiltIn
    Open Browser                http://amazon.com       safari

    Run Keyword And Continue On Failure                 WAIT UNTIL PAGE CONTAINS        This text doesn't exist
    Run Keyword And Continue On Failure                 WAIT UNTIL PAGE CONTAINS        Another text also doesn't exist

    Log Many                    ${some_suite_data}      ${SOME_GLOBAL_DATA}     ${GLOBAL_1}
    Close Browser

Repeat Things
    Repeat Keyword              3 times     Say Something
    Log Many                    ${some_suite_data}      ${SOME_GLOBAL_DATA}     ${GLOBAL_1}

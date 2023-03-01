*** Settings ***
Library                             SeleniumLibrary
Library                             RequestsLibrary

*** Variables ***
${session_alias}                    my_github_session
${github_api}                       https://api.github.com

*** Keywords ***
Check Github Username
    create session                  ${session_alias}        ${github_api}
    ${response}                     get request             ${session_alias}       users/robotframeworktutorial
    should be equal as strings      ${response.status_code}     200
    ${json}                         set variable            ${response.json()}
    should be equal as strings      ${json['login']}        robotframeworktutorial
    log                             ${json}

Display Emoji
    create session                  ${session_alias}        ${github_api}
    ${response}                     get request             ${session_alias}        emojis
    should be equal as strings      ${response.status_code}     200
    ${json}                         set variable            ${response.json()}
    ${emoji_url}                    set variable            ${json['aerial_tramway']}
    open browser                    ${emoji_url}            safari
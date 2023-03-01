*** Settings ***
Documentation                       This Test is about Operating System Library Keywords

Resource                            ../Resources/Operating_System/OS.robot

*** Test Cases ***
Create Some Directories
    [Tags]                          Operating System
    OS.Create Base Directory
    OS.Create Directory 1
    OS.Create Directory 2

Create Some Files
    [Tags]                          Operating System
    OS.Create File 1
    OS.Create File 2
    OS.Create File 3

Move a File
    [Tags]                          Operating System
    OS.Move File 3 from Directory 2 to Directory 1

Copy a File
    [Tags]                          Operating System
    OS.Copy File 1 from Directory 1 to Directory 2
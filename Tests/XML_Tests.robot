*** Settings ***
Documentation                           This Test is about XML Library Keywords

Resource                                ../Resources/XML/Breakfast_Menu.robot

*** Test Cases ***
Verify Menu Count
    [Tags]                              XMl
    Breakfast_Menu.Should Be One Menu in the File

Verify Root
    [Tags]                              XML
    Breakfast_Menu.Verify Menu Name

Verify Food Count
    [Tags]                              XML
    Breakfast_Menu.Verify Food Count

Verify the First Food
    [Tags]                              XMl
    Breakfast_Menu.Verify First Food Name
    Breakfast_Menu.Verify First Food Price
    Breakfast_Menu.Verify First Food Calories

Add a Food
    [Tags]                              XML
    Breakfast_Menu.Add New Food

Verify New Food Was Added
    [Tags]                              XMl
    Breakfast_Menu.Verify Food Should Exist
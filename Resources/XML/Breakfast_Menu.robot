*** Settings ***
Library                             XML

*** Variables ***
${MENU_XML_PATH}                    Resources/XMl/menu.xml
${EXPECTED_MENU_COUNT}              1
${EXPECTED_FOOD_COUNT}              5

*** Keywords ***
Should Be One Menu in the File
    ${menu_count}                   get element count       ${MENU_XML_PATH}
    should be equal as numbers      ${menu_count}           ${EXPECTED_MENU_COUNT}

Verify Menu Name
    ${root}                         parse xml               ${MENU_XML_PATH}
    should be equal                 ${root.tag}             breakfast-menu

Verify Food Count
    ${food_count}                   get element count       ${MENU_XML_PATH}        food
    should be equal as numbers      ${food_count}           ${EXPECTED_FOOD_COUNT}

Verify First Food Name
    ${first_food_name}              get element text        ${MENU_XML_PATH}        food[1]/name
    log                             ${first_food_name}
    should be equal as strings      ${first_food_name}      Belgian Waffles

Verify First Food Price
    ${first_food_price}             get element text        ${MENU_XML_PATH}        food[1]/price
    should be equal as strings      ${first_food_price}     $5.95

Verify First Food Calories
    ${first_food_calories}          get element text        ${MENU_XML_PATH}        food[1]/calories
    should be equal as strings      ${first_food_calories}          650

Add New Food
    ${root}                         parse xml               ${MENU_XML_PATH}
    add element                     ${root}                 <food></food>
    add element                     ${root}                 <name>Grilled Cheese Sandwich</name>            xpath=food[6]
    add element                     ${root}                 <price>$2.95</price>                            xpath=food[6]
    add element                     ${root}                 <description>Yummy melted cheese on grilled sourdough slices</description>          xpath=food[6]
    add element                     ${root}                 <calories>300</calories>                        xpath=food[6]
    save xml                        ${root}                 ${MENU_XML_PATH}

Verify Food Should Exist
    element should exist            ${MENU_XML_PATH}        food[6]
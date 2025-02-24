***Keywords***
Get Every Product And Verify Data
    ${result}              Query        SELECT * FROM product WHERE name='Jetsada phone';
    Should Not Be Empty    ${result}    "Item not exists"

    ${id}=             Set Variable      ${result[0][0]}
    ${name}=           Set Variable      ${result[0][1]}
    ${description}=    Set Variable      ${result[0][2]}
    ${qty}=            Set Variable      ${result[0][3]}
    ${price}=          Set Variable      ${result[0][4]}
    ${rec_status}=     Set Variable      ${result[0][5]}
    ${rec_status}=     Run Keyword If    '${rec_status}' == 'None'    Set Variable    1    ELSE    Set Variable    ${rec_status}

    Log to console    ${id}
    Log to console    ${name}
    Log to console    ${description}
    Log to console    ${qty}
    Log to console    ${price}
    Log to console    ${rec_status}

    Should Be Equal As Numbers    ${id}             666              "Record status does not match!"
    Should Be Equal               ${name}           Jetsada phone    "Product name does not match!"
    Should Be Equal               ${description}    Smartphone       "Description does not match!"
    Should Be Equal As Numbers    ${qty}            10               "Quantity does not match!"
    Should Be Equal As Numbers    ${price}          10000            "Price does not match!"
    Should Be Equal As Numbers    ${rec_status}     1                "Record status does not match!"

    RETURN    ${qty}    ${id}

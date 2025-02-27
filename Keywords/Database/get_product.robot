***Keywords***
Get Every Column Of Product And Verify Data
    [Arguments]    ${pd_id}        ${pd_name}       ${pd_desc}      ${pd_qty}       ${pd_price}     ${pd_rec}

    ${result}              Query        SELECT * FROM product WHERE name='${pd_name}';
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

    Should Be Equal As Numbers    ${id}             ${pd_id}       "Record status does not match!"
    Should Be Equal               ${name}           ${pd_name}     "Product name does not match!"
    Should Be Equal               ${description}    ${pd_desc}     "Description does not match!"
    Should Be Equal As Numbers    ${qty}            ${pd_qty}      "Quantity does not match!"
    Should Be Equal As Numbers    ${price}          ${pd_price}    "Price does not match!"
    Should Be Equal As Numbers    ${rec_status}     ${pd_rec}      "Record status does not match!"

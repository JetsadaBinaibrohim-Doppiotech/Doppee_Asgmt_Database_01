***Keywords***
Connect To Database And Fetch Data
    DatabaseLibrary.Connect To Database    ${DB_DRIVER}           ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    Log To Console                         🟢
    Log To Console                         .Database : Connect

Check If Item Not Exist In Database Then Added
    [Arguments]    ${pd_id}        ${pd_name}       ${pd_desc}      ${pd_qty}       ${pd_price}     ${pd_rec}
    ${result}=     Query           SELECT COUNT(id) FROM product WHERE name='${pd_name}';
    ${count}=      Set Variable    ${result[0][0]}                                              #แถวแนวนอน ที่ [0] แถวแนวตั้ง ที่ [0]

    IF                    ${count} == 0
    Execute SQL String    INSERT INTO product (id, name, description, qty, price, rec_status) VALUES (${pd_id}, '${pd_name}', '${pd_desc}', ${pd_qty}, ${pd_price}, ${pd_rec});
    Log To Console        Database : Inserted "Jetsada phone" into database 

    ${new_count}=                 Query                                                          SELECT COUNT(*) FROM product WHERE name='${pd_name}';
    Should Be Equal As Numbers    ${new_count[0][0]}                                             1                                                           "Insert failed"
    ELSE
    Log To Console                Database : "${pd_name}" already exists, skipping insert 
    END

    RETURN      ${pd_id}        ${pd_name}       ${pd_desc}      ${pd_qty}       ${pd_price}     ${pd_rec}
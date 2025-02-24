***Keywords***
Check If After Item Exist In Database Then Delete
    [Arguments]    ${pd_name}

    ${delete_check}=    Query           SELECT COUNT(id) FROM product WHERE name='${pd_name}';
    ${delete_count}=    Set Variable    ${delete_check[0][0]}

    IF                    ${delete_count} > 0
    Execute SQL String    DELETE FROM product WHERE name='${pd_name}';
    Log To Console        Database : Deleted "Jetsada phone" from database

    ${final_count}=               Query                                                    SELECT COUNT(*) FROM product WHERE name='${pd_name}';
    Should Be Equal As Numbers    ${final_count[0][0]}                                     0                                                           "Delete failed"
    ELSE
    Log To Console                Database : "Jetsada phone" not found, skipping delete
    END

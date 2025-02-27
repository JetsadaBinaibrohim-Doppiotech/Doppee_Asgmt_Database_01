***Keywords***
Decrease Product QTY After Buy Product
    [Arguments]    ${pd_id}    ${pd_qty}

    ${result}=         Query           SELECT qty FROM product WHERE id=${pd_id};
    ${current_qty}=    Set Variable    ${result[0][0]}

    IF                    ${current_qty}>0
    ${new_qty}=           Evaluate                                                ${current_qty} - 1
    Execute SQL String    UPDATE product SET qty=${new_qty} WHERE id=${pd_id};
    Execute SQL String    COMMIT;
    Log To Console        "Decreased QTY from ${current_qty} to ${new_qty}"
    ELSE IF               ${current_qty}==0
    Log To Console        "QTY is 0, cannot decrease."
    END
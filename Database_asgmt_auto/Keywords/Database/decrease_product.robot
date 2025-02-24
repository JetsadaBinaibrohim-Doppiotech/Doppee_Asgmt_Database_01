***Keywords***
Decrease Product QTY After Buy Product
    [Arguments]    ${pd_id}        ${pd_qty}
    
    IF                    ${pd_qty} > 0
    ${new_qty}=           Evaluate                                                         ${pd_qty} - 1
    Execute SQL String    UPDATE product SET qty=${pd_qty} WHERE id=${pd_id};
    Log To Console        "Decreased QTY from ${pd_qty} to ${new_qty}"
    ELSE
    Log To Console        "QTY is 0, cannot decrease."
    END
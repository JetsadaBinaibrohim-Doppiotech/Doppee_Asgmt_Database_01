***Keywords***
Decrease Product QTY
    ${product_qty}        ${product_id}=                                                   Get Every Product And Verify Data
    
    IF                    ${product_qty} > 0
    ${new_qty}=           Evaluate                                                         ${product_qty} - 1
    Execute SQL String    UPDATE product SET qty=${product_qty} WHERE id=${product_id};
    Log To Console        "Decreased QTY from ${product_qty} to ${new_qty}"
    ELSE
    Log To Console        "QTY is 0, cannot decrease."
    END
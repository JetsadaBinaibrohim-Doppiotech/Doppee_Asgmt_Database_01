***Settings***
Resource    ../import.robot

***Test Cases***
TC01 - Verify can add and delete product to database
    [Tags]                                                           tc01
    commom_keyword.Connect To Database And Fetch Data
    commom_keyword.Check If Item Not Exist In Database Then Added    
    ...                                                              ${product_id}     
    ...                                                              ${product_name}  
    ...                                                              ${product_desc}  
    ...                                                              ${product_qty}     
    ...                                                              ${product_price}  
    ...                                                              ${rec_status}
    get_product.Get Every Column Of Product And Verify Data
    ...                                                              ${product_id}     
    ...                                                              ${product_name}  
    ...                                                              ${product_desc}   
    ...                                                              ${product_qty}       
    ...                                                              ${product_price}  
    ...                                                              ${rec_status}
    delete_product.Check If After Item Exist In Database Then Delete 
    ...                                                              ${product_name}    


TC02 - Verify can decrease product qty
    [Tags]                                                           tc02
    commom_keyword.Connect To Database And Fetch Data
    commom_keyword.Check If Item Not Exist In Database Then Added
    ...                                                              ${product_id}     
    ...                                                              ${product_name}  
    ...                                                              ${product_desc}   
    ...                                                              ${product_qty}       
    ...                                                              ${product_price}  
    ...                                                              ${rec_status}
    decrease_product.Decrease Product QTY After Buy Product
    ...                                                              ${product_id}   
    ...                                                              ${product_qty}  
    delete_product.Check If After Item Exist In Database Then Delete
    ...                                                              ${product_name}    
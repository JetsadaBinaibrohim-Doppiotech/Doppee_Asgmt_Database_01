***Settings***
Resource    ../import.robot

***Test Cases***
TC01 - Verify can add and delete product to database
    [Tags]                                                           tc01
    commom_keyword.Connect To Database And Fetch Data
    commom_keyword.Check If Item Not Exist In Database Then Added    
    ...                                                              666     
    ...                                                              Jetsada phone    
    ...                                                              Smartphone    
    ...                                                              10      
    ...                                                              10000.0    
    ...                                                              1
    get_product.Get Every Column Of Product And Verify Data
    ...                                                              666     
    ...                                                              Jetsada phone    
    ...                                                              Smartphone    
    ...                                                              10      
    ...                                                              10000.0    
    ...                                                              1
    delete_product.Check If After Item Exist In Database Then Delete 
    ...                                                              Jetsada phone    


TC02 - Verify can decrease product qty
    [Tags]                                                           tc02
    commom_keyword.Connect To Database And Fetch Data
    commom_keyword.Check If Item Not Exist In Database Then Added
    ...                                                              666     
    ...                                                              Jetsada phone    
    ...                                                              Smartphone    
    ...                                                              10      
    ...                                                              10000.0    
    ...                                                              1
    decrease_product.Decrease Product QTY After Buy Product
    ...                                                              666 
    ...                                                              0  
    #delete_product.Check If After Item Exist In Database Then Delete
    #...                                                              Jetsada phone    
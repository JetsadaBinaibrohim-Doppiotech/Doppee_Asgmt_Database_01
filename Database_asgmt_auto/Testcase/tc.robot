***Settings***
Resource    ../import.robot

***Test Cases***
TC01 - Verify can add and delete product to database
    [Tags]                                                           tc01
    commom_keyword.Connect To Database And Fetch Data
    commom_keyword.Check If Item Not Exist In Database Then Added
    get_product.Get Every Product And Verify Data
    delete_product.Check If Item Exist In Database Then Delete

TC02 - Verify can decrease product qty
    [Tags]                                                           tc02
    commom_keyword.Connect To Database And Fetch Data
    commom_keyword.Check If Item Not Exist In Database Then Added
    decrease_product.Decrease Product QTY
    delete_product.Check If Item Exist In Database Then Delete
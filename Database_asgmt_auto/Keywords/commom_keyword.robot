*** Variables ***
${DB_DRIVER}      psycopg2                #ชนิดของ Database
${DB_HOST}        125.26.15.143           #ที่อยู่ของเซริฟเวอร์
${DB_PORT}        10004                   #พอร์ตของ Database
${DB_NAME}        training_platform_db    #ชื่อของ Database ที่ต้องการเชื่อมต่อ
${DB_USER}        doppio-training-user    #ชื่อผู้ใช้ของ Database
${DB_PASSWORD}    Doppio123*              #รหัสผ่านของ Database

***Keywords***
Connect To Database And Fetch Data
    DatabaseLibrary.Connect To Database    ${DB_DRIVER}          ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    Log To Console                         🟢
    Log To Console                         .Database : Connect
Check If Item Not Exist In Database Then Added
    ${result}=    Query           SELECT COUNT(id) FROM product WHERE name='Jetsada phone';
    ${count}=     Set Variable    ${result[0][0]}   #แถวแนวนอน ที่ [0] แถวแนวตั้ง ที่ [0]

    IF                    ${count} == 0
    Execute SQL String    INSERT INTO product (id, name, description, qty, price, rec_status) VALUES (666, 'Jetsada phone', 'Smartphone', 10, 10000, 1);
    Log To Console        Database : Inserted "Jetsada phone" into database 

    ${new_count}=                 Query                                                         SELECT COUNT(*) FROM product WHERE name='Jetsada phone';
    Should Be Equal As Numbers    ${new_count[0][0]}                                            1                                                           "Insert failed"
    ELSE
    Log To Console                Database : "Jetsada phone" already exists, skipping insert 
    END

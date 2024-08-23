FUNCTION ZCUSTOMER_INTERFACE.
  TABLES: lt_customer_data TYPE kna1.

  DATA: wa_customer_data TYPE kna1.

  " Optimized query to retrieve only necessary data
  SELECT kunnr, name1 
    INTO TABLE lt_customer_data 
    FROM kna1
    WHERE kunnr IN (SELECT kunnr FROM knvv WHERE vkorg = '1000').

  " Process each customer record
  LOOP AT lt_customer_data INTO wa_customer_data.
    WRITE: / 'Customer ID:', wa_customer_data-kunnr, 
           'Name:', wa_customer_data-name1.
  ENDLOOP.

ENDFUNCTION.

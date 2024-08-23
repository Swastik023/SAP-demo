REPORT OLD_CUSTOMER_INTERFACE.

DATA: lt_customer_data TYPE TABLE OF kna1,
      wa_customer_data TYPE kna1.

SELECT * 
  INTO TABLE lt_customer_data 
  FROM kna1.

LOOP AT lt_customer_data INTO wa_customer_data.
  " Logic to process customer data
  WRITE: / 'Customer ID:', wa_customer_data-kunnr, 
         'Name:', wa_customer_data-name1.
ENDLOOP.

FUNCTION ZGET_CUSTOMER_DETAILS.
  IMPORTING
    CUSTOMER_ID TYPE KNA1-KUNNR
  EXPORTING
    CUSTOMER_NAME TYPE KNA1-NAME1
    CUSTOMER_ADDRESS TYPE KNA1-STRAS.

  DATA: wa_customer TYPE kna1.

  " Fetch customer details from KNA1 table
  SELECT SINGLE name1, stras
    INTO (wa_customer-name1, wa_customer-stras)
    FROM kna1
    WHERE kunnr = CUSTOMER_ID.

  " Assign fetched details to output parameters
  CUSTOMER_NAME = wa_customer-name1.
  CUSTOMER_ADDRESS = wa_customer-stras.

ENDFUNCTION.

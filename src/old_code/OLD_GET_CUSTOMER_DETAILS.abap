REPORT OLD_GET_CUSTOMER_DETAILS.

DATA: wa_customer TYPE kna1,
      lv_customer_id TYPE kna1-kunnr,
      lv_customer_name TYPE kna1-name1,
      lv_customer_address TYPE kna1-stras.

PARAMETERS: p_kunnr TYPE kna1-kunnr OBLIGATORY.

SELECT SINGLE name1 stras 
  INTO (lv_customer_name, lv_customer_address)
  FROM kna1
  WHERE kunnr = p_kunnr.

WRITE: / 'Customer Name:', lv_customer_name,
       / 'Customer Address:', lv_customer_address.

REPORT OLD_SALES_REPORT.

DATA: lt_sales TYPE TABLE OF vbak,
      wa_sales TYPE vbak,
      lv_total_sales TYPE p DECIMALS 2.

SELECT * 
  INTO TABLE lt_sales 
  FROM vbak.

LOOP AT lt_sales INTO wa_sales.
  lv_total_sales = lv_total_sales + wa_sales-netwr.
ENDLOOP.

WRITE: / 'Total Sales:', lv_total_sales.

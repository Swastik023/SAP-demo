REPORT OLD_INVENTORY_REPORT.

DATA: lt_stock_levels TYPE TABLE OF mard,
      wa_stock_level TYPE mard,
      lv_total_stock TYPE i.

" The old code retrieves all columns and rows without filtering, causing performance issues
SELECT * 
  INTO TABLE lt_stock_levels 
  FROM mard.

" The code loops through all records, which is inefficient for large datasets
LOOP AT lt_stock_levels INTO wa_stock_level.
  lv_total_stock = lv_total_stock + wa_stock_level-labst.
ENDLOOP.

" Display the total stock without any specific selection criteria
WRITE: / 'Total Stock:', lv_total_stock.

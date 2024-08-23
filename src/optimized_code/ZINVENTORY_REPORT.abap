REPORT ZINVENTORY_REPORT.

DATA: lt_stock_levels TYPE TABLE OF mard,
      wa_stock_level TYPE mard,
      lv_total_stock TYPE i.

PARAMETERS: p_werks TYPE werks_d OBLIGATORY,
            p_lgort TYPE lgort_d.

" Optimized SELECT to fetch only necessary fields and filter by warehouse and storage location
SELECT matnr, lgort, labst 
  INTO TABLE lt_stock_levels 
  FROM mard 
  WHERE werks = p_werks AND lgort = p_lgort AND labst > 0.

" Efficient loop to sum up the stock levels
LOOP AT lt_stock_levels INTO wa_stock_level.
  lv_total_stock = lv_total_stock + wa_stock_level-labst.
ENDLOOP.

" Display the results
WRITE: / 'Warehouse:', p_werks, 'Storage Location:', p_lgort,
       / 'Total Stock:', lv_total_stock.

" Use ALV to display detailed stock levels
CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_callback_program = sy-repid
  TABLES
    t_outtab = lt_stock_levels.

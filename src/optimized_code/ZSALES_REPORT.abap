REPORT ZSALES_REPORT.

DATA: lt_sales TYPE TABLE OF vbak,
      wa_sales TYPE vbak,
      lv_total_sales TYPE p DECIMALS 2.

PARAMETERS: p_vkorg TYPE vbak-vkorg OBLIGATORY,
            p_vtweg TYPE vbak-vtweg.

" Optimized SELECT to fetch only necessary fields for the specific sales organization and distribution channel
SELECT vbeln, netwr 
  INTO TABLE lt_sales 
  FROM vbak 
  WHERE vkorg = p_vkorg AND vtweg = p_vtweg.

" Efficient loop to sum up the net values of sales orders
LOOP AT lt_sales INTO wa_sales.
  lv_total_sales = lv_total_sales + wa_sales-netwr.
ENDLOOP.

" Display the total sales
WRITE: / 'Total Sales for Sales Organization:', p_vkorg, 'and Distribution Channel:', p_vtweg,
       / 'Total Sales:', lv_total_sales.

" Use ALV to display detailed sales data
CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_callback_program = sy-repid
  TABLES
    t_outtab = lt_sales.

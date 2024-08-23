FORM optimize_query.

  DATA: lt_optimized_results TYPE TABLE OF mara,
        lv_total_value TYPE p DECIMALS 2.

  " Optimized SELECT statement fetching only required fields
  SELECT matnr, maktx, mtart, meins
    INTO TABLE lt_optimized_results
    FROM mara
    WHERE mtart = 'FERT' AND meins = 'PC'.

  " Efficient loop to calculate the total value
  LOOP AT lt_optimized_results INTO DATA(wa_result).
    lv_total_value = lv_total_value + wa_result-matnr.
  ENDLOOP.

  " Display the total value of finished products
  WRITE: / 'Total Value of Finished Products (PC):', lv_total_value.

ENDFORM.

FORM old_query.

  DATA: lt_results TYPE TABLE OF mara,
        lv_total_value TYPE p DECIMALS 2.

  " The old query fetches all columns and does not apply proper filtering
  SELECT * 
    INTO TABLE lt_results
    FROM mara.

  " Looping through all records increases processing time
  LOOP AT lt_results INTO DATA(wa_result).
    lv_total_value = lv_total_value + wa_result-matnr.
  ENDLOOP.

  " Display total value without relevant filtering or optimization
  WRITE: / 'Total Value:', lv_total_value.

ENDFORM.

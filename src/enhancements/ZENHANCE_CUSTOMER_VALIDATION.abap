ENHANCEMENT-SECTION ZENHANCE_CUSTOMER_VALIDATION SPOTS ES_CUSTOMER.
  DATA: lv_validation_status TYPE char1.

  " Validate customer before processing order
  SELECT SINGLE validation_status INTO lv_validation_status
    FROM zcustomer_table
    WHERE customer_id = p_kunnr.

  IF lv_validation_status = 'X'.
    MESSAGE 'Customer validation failed' TYPE 'E'.
  ENDIF.
END-ENHANCEMENT-SECTION.

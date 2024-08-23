ENHANCEMENT-SECTION ZENHANCE_MATERIAL_PROCESSING SPOTS ES_MATERIAL.
  DATA: lv_material_status TYPE char1.

  " Check material status before processing
  SELECT SINGLE mmsta INTO lv_material_status
    FROM mara
    WHERE matnr = p_matnr.

  IF lv_material_status = 'Z'.
    MESSAGE 'Material is blocked for processing' TYPE 'E'.
  ENDIF.
END-ENHANCEMENT-SECTION.

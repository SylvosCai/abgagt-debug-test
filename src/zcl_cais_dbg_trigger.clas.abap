CLASS zcl_cais_dbg_trigger DEFINITION
  PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_cais_dbg_trigger IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA lv_result TYPE i.

    CALL FUNCTION 'ZCAIS_DBG_ADD'
      EXPORTING
        iv_a     = 3
        iv_b     = 4
      IMPORTING
        ev_result = lv_result.

    out->write( |3 + 4 = { lv_result }| ).
  ENDMETHOD.
ENDCLASS.

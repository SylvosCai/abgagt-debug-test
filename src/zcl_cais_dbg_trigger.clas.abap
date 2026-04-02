CLASS zcl_cais_dbg_trigger DEFINITION
  PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    METHODS compute
      IMPORTING iv_a     TYPE i
                iv_b     TYPE i
      RETURNING VALUE(rv_result) TYPE i.
ENDCLASS.

CLASS zcl_cais_dbg_trigger IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA lv_result TYPE i.

    CALL FUNCTION 'ZCAIS_DBG_ADD'
      EXPORTING
        iv_a      = 3
        iv_b      = 4
      IMPORTING
        ev_result = lv_result.

    lv_result = compute( iv_a = lv_result iv_b = 1 ).
    out->write( |result = { lv_result }| ).
  ENDMETHOD.

  METHOD compute.
    rv_result = iv_a + iv_b.        " line 30 — stable CLAS breakpoint
  ENDMETHOD.
ENDCLASS.

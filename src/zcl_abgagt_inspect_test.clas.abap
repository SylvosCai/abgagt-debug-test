CLASS zcl_abgagt_inspect_test DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_abgagt_inspect_test IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " This class intentionally contains code patterns that trigger
    " Code Inspector findings, used for integration testing of the
    " abapgit-agent inspect command (error/warning/suppress tests).

    " Pattern 1: CALL FUNCTION with non-existent FM → inspect warning
    DATA lv_result TYPE string.
    CALL FUNCTION 'ZNONEXISTENT_FM_FOR_INSPECT'
      IMPORTING
        ev_result = lv_result
      EXCEPTIONS
        OTHERS    = 1.

    out->write( lv_result ).
  ENDMETHOD.
ENDCLASS.

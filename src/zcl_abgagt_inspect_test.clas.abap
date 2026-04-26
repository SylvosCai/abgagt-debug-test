CLASS zcl_abgagt_inspect_test DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_abgagt_inspect_test IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " This class intentionally contains code patterns that trigger
    " Code Inspector findings, used for integration testing of the
    " abapgit-agent inspect command (error/warning/suppress tests).

    " Pattern: SELECT * and implicit INTO WORK AREA — commonly flagged
    DATA lt_tadir TYPE STANDARD TABLE OF tadir.
    SELECT * FROM tadir INTO TABLE lt_tadir UP TO 1 ROWS
      WHERE pgmid = 'R3TR' AND object = 'CLAS' AND obj_name = 'ZCL_ABGAGT_INSPECT_TEST'.

    " Pattern: DESCRIBE TABLE with obsolete syntax
    DATA lv_lines TYPE i.
    DESCRIBE TABLE lt_tadir LINES lv_lines.

    out->write( |Found { lv_lines } entries| ).
  ENDMETHOD.
ENDCLASS.

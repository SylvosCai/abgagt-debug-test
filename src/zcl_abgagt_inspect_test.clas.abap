CLASS zcl_abgagt_inspect_test DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_abgagt_inspect_test IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " This class intentionally triggers Code Inspector findings for
    " integration testing of the inspect command (error/warning/suppress).
    "
    " Trigger: SELECT * from a table with many columns, but use only
    " one field. The CI check "Search for SELECT * FROM dbtab" flags
    " this as FEW when < 20% of fields are used.

    DATA lt_tadir TYPE STANDARD TABLE OF tadir.

    " SELECT * from TADIR (~15 columns) but only use OBJ_NAME (1 field = ~7%)
    SELECT * FROM tadir INTO TABLE lt_tadir UP TO 1 ROWS
      WHERE pgmid = 'R3TR' AND object = 'CLAS' AND obj_name = 'ZCL_ABGAGT_INSPECT_TEST'.

    " Only access one field — triggers FEW finding
    LOOP AT lt_tadir ASSIGNING FIELD-SYMBOL(<ls>).
      out->write( <ls>-obj_name ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

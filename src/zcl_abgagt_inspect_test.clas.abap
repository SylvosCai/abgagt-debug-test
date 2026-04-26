CLASS zcl_abgagt_inspect_test DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_abgagt_inspect_test IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " This class intentionally triggers Code Inspector findings for
    " integration testing of the inspect command (error/warning/suppress).
    "
    " Trigger: SORT inside a LOOP — CI check "SORT Statement Inside a Loop"
    " flags this as a performance issue. Suppressible with #EC CI_SORTLOOP.

    DATA lt_data TYPE STANDARD TABLE OF tadir.

    SELECT * FROM tadir INTO TABLE lt_data UP TO 5 ROWS
      WHERE pgmid = 'R3TR' AND object = 'CLAS'.

    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<ls>).
      " SORT inside LOOP → triggers CI finding
      SORT lt_data BY obj_name.
      out->write( <ls>-obj_name ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

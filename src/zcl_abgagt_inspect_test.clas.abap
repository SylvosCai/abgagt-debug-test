CLASS zcl_abgagt_inspect_test DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_abgagt_inspect_test IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " This class intentionally triggers Code Inspector findings for
    " integration testing of the inspect command (error/warning/suppress).
    "
    " Trigger: SORT inside a DO loop — CI check "SORT Statement Inside a Loop"
    " flags this as a performance issue. Suppressible with #EC CI_SORTLOOP.

    DATA lt_data TYPE STANDARD TABLE OF tadir.
    DATA lt_other TYPE STANDARD TABLE OF tadir.

    SELECT * FROM tadir INTO TABLE lt_data UP TO 5 ROWS
      WHERE pgmid = 'R3TR' AND object = 'CLAS'.

    lt_other = lt_data.

    DO 3 TIMES.
      " SORT inside DO loop → triggers CI_SORTLOOP finding
      SORT lt_other BY obj_name.
      READ TABLE lt_other INDEX 1 ASSIGNING FIELD-SYMBOL(<ls>).
      IF sy-subrc = 0.
        out->write( <ls>-obj_name ).
      ENDIF.
    ENDDO.
  ENDMETHOD.
ENDCLASS.

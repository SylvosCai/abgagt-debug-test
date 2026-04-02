CLASS ltcl_compute DEFINITION FINAL FOR TESTING
  RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    METHODS test_add FOR TESTING.
ENDCLASS.

CLASS ltcl_compute IMPLEMENTATION.
  METHOD test_add.
    DATA lo_cut TYPE REF TO zcl_cais_dbg_trigger.
    CREATE OBJECT lo_cut.
    cl_abap_unit_assert=>assert_not_initial( lo_cut ).  " line 12 — testclasses BP
  ENDMETHOD.
ENDCLASS.

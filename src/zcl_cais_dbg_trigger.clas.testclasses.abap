CLASS ltcl_compute DEFINITION FINAL FOR TESTING
  RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    METHODS test_add FOR TESTING.
ENDCLASS.

CLASS ltcl_compute IMPLEMENTATION.
  METHOD test_add.
    cl_abap_unit_assert=>assert_equals(    " line 10
      act = 3 + 4                          " line 11
      exp = 7 ).                           " line 12
  ENDMETHOD.
ENDCLASS.

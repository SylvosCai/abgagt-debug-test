CLASS ltcl_compute DEFINITION FINAL FOR TESTING
  RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    METHODS test_add FOR TESTING.
ENDCLASS.

CLASS ltcl_compute IMPLEMENTATION.
  METHOD test_add.
    DATA(lv_sum) = 3 + 4.
    cl_abap_unit_assert=>assert_equals( act = lv_sum exp = 7 ).  " line 11
  ENDMETHOD.
ENDCLASS.

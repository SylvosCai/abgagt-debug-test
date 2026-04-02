CLASS ltcl_helper DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS double
      IMPORTING iv_val        TYPE i
      RETURNING VALUE(rv_val) TYPE i.
ENDCLASS.

CLASS ltcl_helper IMPLEMENTATION.
  METHOD double.
    rv_val = iv_val * 2.  " line 10 — valid testclasses BP (non-FOR-TESTING method)
  ENDMETHOD.
ENDCLASS.

CLASS ltcl_compute DEFINITION FINAL FOR TESTING
  RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    METHODS test_double FOR TESTING.
ENDCLASS.

CLASS ltcl_compute IMPLEMENTATION.
  METHOD test_double.
    cl_abap_unit_assert=>assert_equals(
      act = ltcl_helper=>double( 5 )
      exp = 10 ).
  ENDMETHOD.
ENDCLASS.

CLASS zcl_abgagt_inspect_test DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_abgagt_inspect_test IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " This class intentionally contains code patterns that trigger
    " Code Inspector findings, used for integration testing of the
    " abapgit-agent inspect command (error/warning/suppress tests).

    " Pattern 1: unused variable → CI warning
    DATA lv_unused_var TYPE string.

    " Pattern 2: unreachable code after RETURN → CI warning
    out->write( 'inspect test' ).
    RETURN.
    out->write( 'unreachable' ).  "#EC NEEDED
  ENDMETHOD.
ENDCLASS.

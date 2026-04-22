CLASS zcl_abgagt_dbg_trigger DEFINITION
  PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES: BEGIN OF ty_person,
             name TYPE string,
             age  TYPE i,
           END OF ty_person.
    TYPES ty_persons TYPE STANDARD TABLE OF ty_person WITH DEFAULT KEY.

  PRIVATE SECTION.
    METHODS compute
      IMPORTING iv_a     TYPE i
                iv_b     TYPE i
      RETURNING VALUE(rv_result) TYPE i.

    METHODS inspect_vars.
ENDCLASS.

CLASS zcl_abgagt_dbg_trigger IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA lv_result TYPE i.

    CALL FUNCTION 'ZABGAGT_DBG_ADD'
      EXPORTING
        iv_a      = 3
        iv_b      = 4
      IMPORTING
        ev_result = lv_result.

    lv_result = compute( iv_a = lv_result iv_b = 1 ).
    out->write( |result = { lv_result }| ).
    inspect_vars( ).
  ENDMETHOD.

  METHOD compute.
    " compute: add two integers — unexecutable lines before first statement
    DATA lv_sum TYPE i.

    lv_sum = iv_a + iv_b.
    rv_result = lv_sum.
  ENDMETHOD.

  METHOD inspect_vars.
    DATA ls_person  TYPE ty_person.
    DATA lt_persons TYPE ty_persons.
    DATA lr_person  TYPE REF TO ty_person.
    FIELD-SYMBOLS <ls> TYPE ty_person.

    ls_person = VALUE #( name = 'Alice' age = 30 ).
    lt_persons = VALUE #(
      ( name = 'Alice' age = 30 )
      ( name = 'Bob'   age = 25 ) ).

    ASSIGN lt_persons[ 1 ] TO <ls>.
    lr_person = REF #( ls_person ).

    WRITE 'inspect'. "← breakpoint: all vars populated
  ENDMETHOD.
ENDCLASS.

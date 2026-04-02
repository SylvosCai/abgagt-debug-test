CLASS lcl_helper IMPLEMENTATION.
  METHOD describe.
    " describe: return label — unexecutable lines before first statement
    DATA lv_label TYPE string.

    lv_label = 'debug-test'.
    rv_text = lv_label.
  ENDMETHOD.
ENDCLASS.

FUNCTION zcais_dbg_add.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_A) TYPE  I
*"     VALUE(IV_B) TYPE  I
*"  EXPORTING
*"     VALUE(EV_RESULT) TYPE  I
*"----------------------------------------------------------------------
  " zcais_dbg_add: unexecutable lines before first statement
  DATA lv_result TYPE i.

  lv_result = iv_a + iv_b.
  ev_result = lv_result.

ENDFUNCTION.

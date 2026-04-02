FUNCTION zcais_dbg_add.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_A) TYPE  I
*"     VALUE(IV_B) TYPE  I
*"  EXPORTING
*"     VALUE(EV_RESULT) TYPE  I
*"----------------------------------------------------------------------

  ev_result = iv_a + iv_b.

ENDFUNCTION.

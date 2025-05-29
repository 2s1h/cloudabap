CLASS zcl_2666_iterate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_2666_ITERATE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    CONSTANTS: max_count TYPE i VALUE 20.

    DATA: count   TYPE i,
          numbers TYPE TABLE OF i,
          sum     TYPE i.



    DO max_count TIMES.
      count = sy-index.

      IF count < 3.
        APPEND 1 TO numbers.
      ELSE.
        APPEND numbers[ count - 1 ] +
               numbers[ count - 2 ] TO numbers.
      ENDIF.
    ENDDO.
    DATA(counter) = 0.
    LOOP AT numbers INTO DATA(number).
        counter = sy-tabix.
        out->write( |{ counter }번째 피보나치 수열의 값 { number } 입니다.| ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

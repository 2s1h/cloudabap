CLASS zcl_2666_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_2666_COMPUTE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: number1 TYPE i VALUE 8,
          number2 TYPE i VALUE 3.
  DATA: result TYPE P DECIMALS 2,
        output TYPE string.

        result = number1 / number2.
        output = | { number1 } / { number2 } = { result } |.
        out->write( output ).
  ENDMETHOD.
ENDCLASS.

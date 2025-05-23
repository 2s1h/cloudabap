CLASS zcl_2666_branch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_2666_BRANCH IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Declarations
**************************

    DATA number1 TYPE i.
    DATA number2 TYPE i.

    DATA result TYPE p LENGTH 8 DECIMALS 2.

    DATA op TYPE c LENGTH 1 VALUE '/'.
    DATA output TYPE string.


* Input Values
**************************

    number1 = -8.
    number2 = 0.

* Calculation
**************************

*    DATA(result) = number1 / number2.
    CASE op.
      WHEN '+'.
        result = number1 + number2.
      WHEN '-'.
        result = number1 - number2.
      WHEN '*'.
        result = number1 * number2.
      WHEN '/'.
        TRY .
            result = number1 / number2.
            output = |{  number1 } { op } { number2  } = { result }|.
          CATCH cx_sy_zerodivide.
          output = 'test' & 'test'.
*            output = |Divided by Zero, please | & |checking your Input Value|.
        ENDTRY.
    ENDCASE.




* Output
**************************

    out->write( output ).
  ENDMETHOD.
ENDCLASS.

CLASS zcl_2666_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_2666_TEST IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
* Comment/Uncomment the following lines to change the type of my_var
    TYPES my_type TYPE p LENGTH 3 DECIMALS 2.
* TYPES my_type TYPE i .
* TYPES my_type TYPE string.
* TYPES my_type TYPE n length 10.
* Variable based on local type
    DATA my_variable TYPE my_type VALUE '100.25'.
    out->write( `my_variable (TYPE MY_TYPE)` ).
    out->write( my_variable ).
* Variable based on global type .
    " Place cursor on variable and press F2 or F3
    DATA airport TYPE /dmo/airport_id VALUE 'FRA'.
    out->write( `airport (TYPE /DMO/AIRPORT_ID )` ).
    out->write( airport ).
  ENDMETHOD.
ENDCLASS.

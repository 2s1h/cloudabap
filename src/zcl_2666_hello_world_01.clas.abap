CLASS zcl_2666_hello_world_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_2666_HELLO_WORLD_01 IMPLEMENTATION.


    METHOD if_oo_adt_classrun~main.
        out->write( 'Hello World!' ).
    ENDMETHOD.
ENDCLASS.

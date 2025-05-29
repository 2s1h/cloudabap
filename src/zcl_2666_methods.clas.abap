CLASS zcl_2666_methods DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_2666_METHODS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.
    connection = NEW #( ).
    connection->set_attributes(
                    EXPORTING iv_carrid = 'AA'
                              iv_connid = '0017' ).
    APPEND connection TO connections.

    connection = NEW #( ).
    connection->set_attributes(
                    EXPORTING iv_carrid = 'AA'
                              iv_connid = '0064' ).
    APPEND connection TO connections.

    connection = NEW #( ).
    connection->set_attributes(
                    EXPORTING iv_carrid = 'LH'
                              iv_connid = '0400' ).
    APPEND connection TO connections.

    LOOP AT connections INTO connection.
        out->write( connection->get_output( ) ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

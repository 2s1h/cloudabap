CLASS zcl_2666_local_class_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_2666_LOCAL_CLASS_1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA connection TYPE REF TO lcl_connection.

    connection = new #( ).
    DATA connections TYPE TABLE OF REF TO lcl_connection.
    connection->carrier_id = 'LH'.
    connection->connection_id = '0400'.
    connection->conn_counter += 1.
    APPEND connection to connections.

    clear connection.

    connection = new #( ).
    connection->carrier_id = 'AA'.
    connection->connection_id = '0017'.
    connection->conn_counter += 1.
    APPEND connection to connections.



    clear connection.

    connection = new #( ).
    connection->carrier_id = 'AA'.
    connection->connection_id = '0064'.
    lcl_connection=>conn_counter += 1.
    APPEND connection to connections.




*    connection = VALUE #( carrier_id = 'LH'
*                           connection_id = '0400' ).

  ENDMETHOD.
ENDCLASS.

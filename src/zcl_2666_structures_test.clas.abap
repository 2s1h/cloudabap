CLASS zcl_2666_structures_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES: BEGIN OF  st_connection,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

    TYPES: BEGIN OF  st_connection_nested,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             mesg            TYPE symsg,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection_nested.
    TYPES : BEGIN OF st_connection_short,
              DepartureAiport    TYPE /dmo/airport_from_id,
              DestinationAirport TYPE /dmo/airport_to_id,
            END OF st_connection_short.


    DATA : BEGIN OF gs_ren,
             name(20)    VALUE 'SEONGYUN SEO',
             country(10) VALUE 'KOREA',
             city(20)    VALUE 'JINJU',
           END OF gs_ren,

           BEGIN OF gs_info,
             name(20),
             city(20),
             phone(10) VALUE '152100124',
           END OF gs_info.

ENDCLASS.



CLASS ZCL_2666_STRUCTURES_TEST IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: connection        TYPE st_connection,
          connection_nested TYPE st_connection_nested.
**********************************************************************
*    connection-airport_from_id = 'ABC'.
*    connection-airport_to_id = 'XYZ'.
*    connection-carrier_name = 'My Airline'.
*
*    connection_nested = connection.
*    connection_nested = CORRESPONDING #( connection ).
*    connection_nested = CONV #( connection ).
*
*    connection = VALUE #( airport_from_id = 'QWE'
*                          airport_to_id = 'RTY'
*                          carrier_name = 'Your Airline'
*                          ).
*    connection_nested = VALUE #( airport_from_id = 'ABC'
*                            airport_to_id = 'XYZ'
*                            mesg = VALUE #(
*                            msgty = 'E'
*                            msgid = 'ABC'
*                            msgno = '123' )
*                            carrier_name = 'My Airline' ).


**********************************************************************

*    connection_nested = connection.
*    out->write( `-------------------------------------------------------------` ).
*    out->write( `Example 3: Wrong Result after direct assignment` ).
*    out->write( |Component connection_nested-message-msgid: | &
*                |{ connection_nested-mesg-msgid }| ).
*    out->write( |Component connection_nested-carrier_name : | &
*                |{ connection_nested-carrier_name }| ).
*    CLEAR connection_nested.
*    connection_nested = CORRESPONDING #( connection ).
*    out->write( `Example 4: Correct Result after assignment with CORRESPONDING` ).
*    out->write( |Component connection_nested-message-msgid: | &
*                |{ connection_nested-mesg-msgid }| ).
*    out->write( |Component connection_nested-carrier_name : | &
*                |{ connection_nested-carrier_name }| ).

**********************************************************************


*    gs_info = CORRESPONDING #( gs_ren ).
*    gs_info = CORRESPONDING #( BASE ( gs_info ) gs_ren ).

**********************************************************************

    SELECT SINGLE
        FROM /DMO/I_Connection
        FIELDS DepartureAirport, DestinationAirport, \_Airline-Name
        WHERE AirlineID = 'LH'
        AND ConnectionID = '0400'
        INTO @connection.
    out->write( `------------------------------` ).
    out->write( `Example 1: Field List and INTO` ).
    out->write( connection ).
    DATA connection_full TYPE /DMO/I_Connection.
    SELECT SINGLE
        FROM /DMO/I_Connection
        FIELDS *
                WHERE AirlineID = 'LH'
        AND ConnectionID = '0400'
        INTO @connection_full.

    out->write( `----------------------------` ).
    out->write( `Example 2: FIELDS * and INTO` ).
    out->write( connection_full ).

    DATA connection_short TYPE st_connection_short.

    SELECT SINGLE
        FROM /DMO/I_Connection
        FIELDS *
        WHERE AirlineID = 'LH' AND ConnectionID = '0400'
        INTO CORRESPONDING FIELDS OF @connection_short.
    out->write( `----------------------------------------------------` ).
    out->write( `Ex 3: FIELDS * and INTO CORRESPONDING FIELDS OF` ).
    out->write( connection_short ).

    CLEAR connection.

    SELECT SINGLE
        FROM /DMO/I_Connection
        FIELDS DepartureAirport AS airport_from_id,
                \_Airline-Name AS carrier_name

        WHERE AirlineID = 'LH' AND ConnectionID = '0400'
        INTO CORRESPONDING FIELDS OF @connection.
    out->write( `----------------------------------------------------` ).
    out->write( `Ex 4: Aliases and INTO CORRESPONDING FIELDS OF` ).
    out->write( connection_short ).



    SELECT SINGLE
        FROM /DMO/I_Connection
        FIELDS DepartureAirport,
                DestinationAirport AS ArrivalAirport,
                \_Airline-Name AS AirlineName
                WHERE AirlineID = 'LH' AND ConnectionID = '0400'
        INTO @DATA(connection_inline).
    out->write( `----------------------------------------------------` ).
    out->write( `Example 5: Aliases and Inline Declaration` ).
    out->write( connection_short ).


    SELECT SINGLE
        FROM /dmo/connection AS c
        LEFT OUTER JOIN /dmo/airport AS f
            ON c~airport_from_id = f~airport_id
        FIELDS c~carrier_id, c~connection_id,
               c~airport_from_id , c~airport_to_id,
               f~name AS airport_from_name
               WHERE c~carrier_id = 'LH' AND c~connection_id = '0400'
   INTO @DATA(connection_join).
    out->write( `------------------------------------------` ).
    out->write( `Example 6: Join of Connection and Airports` ).
    out->write( connection_join ).

  ENDMETHOD.
ENDCLASS.

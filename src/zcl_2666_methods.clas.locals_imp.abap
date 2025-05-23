*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_connection DEFINITION.
  PUBLIC SECTION.
    DATA: carrier_id    TYPE /dmo/carrier_id READ-ONLY,
          connection_id TYPE /dmo/connection_id READ-ONLY.

    CLASS-DATA conn_counter TYPE i.


    METHODS: get_output RETURNING VALUE(r_output) TYPE  string_table,
      set_attributes
        IMPORTING iv_carrid TYPE /dmo/carrier_id
                  iv_connid TYPE /dmo/connection_id.


ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.
  METHOD get_output.
    APPEND |--------------------------------| TO r_output.
    APPEND |Carrier: { carrier_id }| TO r_output.
    APPEND |Connection: { connection_id }| TO r_output.

  ENDMETHOD.
  METHOD set_attributes.
    IF iv_carrid is INITIAL or iv_connid is INITIAL.
        raise EXCEPTION TYPE CX_ABAP_INVALID_VALUE.
    ELSE.

    me->carrier_id = iv_carrid.
    me->connection_id = iv_connid.
    conn_counter += 1.
    ENDIF.
  ENDMETHOD.
ENDCLASS.

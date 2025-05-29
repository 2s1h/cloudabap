*"* use this source file for your ABAP unit test classes

CLASS ltcl_find_flights DEFINITION for TESTING DURATION LONG
  RISK LEVEL HARMLESS.
  PUBLIC SECTION.
    METHODS test_find_cargo_flight FOR TESTING.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS ltcl_find_flights IMPLEMENTATION.


  METHOD test_find_cargo_flight.
    SELECT SINGLE
      FROM /lrn/cargoflight
      FIELDS carrier_id, connection_id, flight_date, airport_from_id, airport_to_id
      INTO @DATA(some_flight_data).
    IF sy-subrc <> 0.
      cl_abap_unit_assert=>fail( 'NO Data in Table /LRN/CARGOFLIGHT.' ).
    ELSE.
      TRY.
          DATA(carrier) = NEW lcl_carrier(  i_carrier_id = some_flight_data-carrier_id ).
        CATCH cx_abap_invalid_value.
          cl_abap_unit_assert=>fail( 'Unable to instantiate lcl_carrier' ).
      ENDTRY.
      carrier->find_cargo_flight(
        EXPORTING
          i_airport_from_id = some_flight_data-airport_from_id
          i_airport_to_id   = some_flight_data-airport_to_id
          i_from_date       = some_flight_data-flight_date
          i_cargo           = 1
        IMPORTING
          e_flight          = DATA(flight)
          e_days_later      = DATA(days_later)
      ).
      cl_abap_unit_assert=>assert_bound(
        EXPORTING
          act              = flight
          msg              = 'Method find_cargo_flight does not return a result.'
*          level            = if_abap_unit_constant=>severity-medium
*          quit             = if_abap_unit_constant=>quit-test
*        RECEIVING
*          assertion_failed =
      ).
      cl_abap_unit_assert=>assert_equals(
        EXPORTING
          act                  = days_later
          exp                  = 0
          msg                  = 'Method find_cargo_flight returns wrong result.'
      ).


*
    ENDIF.
  ENDMETHOD.

ENDCLASS.

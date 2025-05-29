CLASS zcl_2666_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: agencies_upd TYPE TABLE FOR UPDATE /DMO/I_AgencyTP.
ENDCLASS.



CLASS ZCL_2666_EML IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*  SELECT SINGLE
*    FROM /DMO/I_AgencyTP
*    FIELDS AgencyID, Name
*    WHERE AgencyID = '070026'
*    INTO @agencies_upd.

    agencies_upd = VALUE #( ( AgencyID = '070026' Name = 'Extreme Weird Travel' ) ).

    MODIFY ENTITIES OF /DMO/I_AgencyTP
        ENTITY /DMO/Agency
        UPDATE FIELDS ( Name )
          WITH agencies_upd.


    COMMIT ENTITIES.

    out->write( 'Method execution finished!' ).

*    agencies_upd-Name = ''.


  ENDMETHOD.
ENDCLASS.

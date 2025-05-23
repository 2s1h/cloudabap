@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_2666FLIGHT
  provider contract transactional_query
  as projection on ZR_2666FLIGHT
{

@Consumption.valueHelpDefinition: [{ entity.name: 'ZS4D400_I_CARRIERVH',
                                           entity.element: 'CarrierID' }]
  key CarrierId,
  
  key ConnectionId,
  key FlightDate,
      Price,
      @Semantics.currencyCode: true
      @Consumption.valueHelpDefinition: [{ entity.name: 'I_CurrencyStdVH',
                                           entity.element: 'Currency' }]
      CurrencyCode,
      PlaneTypeId,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt

}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_chargedetailpoint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseChargeDetailPoint _$ResponseChargeDetailPointFromJson(
    Map<String, dynamic> json) {
  return ResponseChargeDetailPoint(
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    errors: json['errors'],
    message: json['message'] as String?,
    returnStatus: json['returnStatus'] as bool?,
  );
}

Map<String, dynamic> _$ResponseChargeDetailPointToJson(
        ResponseChargeDetailPoint instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errors': instance.errors,
      'message': instance.message,
      'returnStatus': instance.returnStatus,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    chargingZoneId: json['chargingZoneId'] as int?,
    manufactureDate: (json['manufactureDate'] as num?)?.toDouble(),
    networkType: json['networkType'] as String?,
    networkTypeDisplay: json['networkTypeDisplay'] as String?,
    chargeBox: json['chargeBox'] as String?,
    systemStatus: json['systemStatus'] as String?,
    systemStatusDisplay: json['systemStatusDisplay'] as String?,
    hardwareStatus: json['hardwareStatus'] as String?,
    hardwareStatusDisplay: json['hardwareStatusDisplay'],
    updatedDate: (json['updatedDate'] as num?)?.toDouble(),
    networkProtocol: json['networkProtocol'] as String?,
    networkProtocolDisplay: json['networkProtocolDisplay'] as String?,
    enableLocalAuthList: json['enableLocalAuthList'] as bool?,
    reservationSupport: json['reservationSupport'] as bool?,
    createdDate: (json['createdDate'] as num?)?.toDouble(),
    lastHeartbeatAt: (json['lastHeartbeatAt'] as num?)?.toDouble(),
    heartbeatInterval: json['heartbeatInterval'] as int?,
    chargePointAvailablityCheckCount:
        json['chargePointAvailablityCheckCount'] as String?,
    landOwnerId: json['landOwnerId'] as int?,
    landOwnerName: json['landOwnerName'] as String?,
    msfId: json['msfId'] as int?,
    msfName: json['msfName'] as String?,
    sfId: json['sfId'] as int?,
    sfName: json['sfName'] as String?,
    distributorId: json['distributorId'] as int?,
    distributorName: json['distributorName'] as String?,
    dealerId: json['dealerId'] as int?,
    dealerName: json['dealerName'] as String?,
    landOwnerAgencyId: json['landOwnerAgencyId'] as int?,
    landOwnerAgencyName: json['landOwnerAgencyName'] as String?,
    msfPercentage: (json['msfPercentage'] as num?)?.toDouble(),
    sfPercentage: (json['sfPercentage'] as num?)?.toDouble(),
    distributorPercentage: (json['distributorPercentage'] as num?)?.toDouble(),
    dealerPercentage: (json['dealerPercentage'] as num?)?.toDouble(),
    chargePointHarwareInfo: json['chargePointHarwareInfo'] as String?,
    chargePointOwner: json['chargePointOwner'] as String?,
    chargePointOwnerId: json['chargePointOwnerId'] as int?,
    chargePointOwnerName: json['chargePointOwnerName'] as String?,
    diagnosticLogPath: json['diagnosticLogPath'],
    isDiagnosticLogsAvailable: json['isDiagnosticLogsAvailable'] as bool?,
    connectionStatus: json['connectionStatus'] as String?,
    connectionStatusDisplay: json['connectionStatusDisplay'] as String?,
    chargingZoneName: json['chargingZoneName'] as String?,
    isAccessible: json['isAccessible'] as bool?,
    isPublic: json['isPublic'] as bool?,
    chargingZone: json['chargingZone'] == null
        ? null
        : ChargingZone.fromJson(json['chargingZone'] as Map<String, dynamic>),
    chargePointEvse: (json['chargePointEvse'] as List<dynamic>?)
        ?.map((e) => ChargePointEvseElement.fromJson(e as Map<String, dynamic>))
        .toList(),
    chargePointId: json['chargePointId'] as int?,
    name: json['name'] as String?,
    evseDetails: json['evseDetails'],
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'chargingZoneId': instance.chargingZoneId,
      'manufactureDate': instance.manufactureDate,
      'networkType': instance.networkType,
      'networkTypeDisplay': instance.networkTypeDisplay,
      'chargeBox': instance.chargeBox,
      'systemStatus': instance.systemStatus,
      'systemStatusDisplay': instance.systemStatusDisplay,
      'hardwareStatus': instance.hardwareStatus,
      'hardwareStatusDisplay': instance.hardwareStatusDisplay,
      'updatedDate': instance.updatedDate,
      'networkProtocol': instance.networkProtocol,
      'networkProtocolDisplay': instance.networkProtocolDisplay,
      'enableLocalAuthList': instance.enableLocalAuthList,
      'reservationSupport': instance.reservationSupport,
      'createdDate': instance.createdDate,
      'lastHeartbeatAt': instance.lastHeartbeatAt,
      'heartbeatInterval': instance.heartbeatInterval,
      'chargePointAvailablityCheckCount':
          instance.chargePointAvailablityCheckCount,
      'landOwnerId': instance.landOwnerId,
      'landOwnerName': instance.landOwnerName,
      'msfId': instance.msfId,
      'msfName': instance.msfName,
      'sfId': instance.sfId,
      'sfName': instance.sfName,
      'distributorId': instance.distributorId,
      'distributorName': instance.distributorName,
      'dealerId': instance.dealerId,
      'dealerName': instance.dealerName,
      'landOwnerAgencyId': instance.landOwnerAgencyId,
      'landOwnerAgencyName': instance.landOwnerAgencyName,
      'msfPercentage': instance.msfPercentage,
      'sfPercentage': instance.sfPercentage,
      'distributorPercentage': instance.distributorPercentage,
      'dealerPercentage': instance.dealerPercentage,
      'chargePointHarwareInfo': instance.chargePointHarwareInfo,
      'chargePointOwner': instance.chargePointOwner,
      'chargePointOwnerId': instance.chargePointOwnerId,
      'chargePointOwnerName': instance.chargePointOwnerName,
      'diagnosticLogPath': instance.diagnosticLogPath,
      'isDiagnosticLogsAvailable': instance.isDiagnosticLogsAvailable,
      'connectionStatus': instance.connectionStatus,
      'connectionStatusDisplay': instance.connectionStatusDisplay,
      'chargingZoneName': instance.chargingZoneName,
      'isAccessible': instance.isAccessible,
      'isPublic': instance.isPublic,
      'chargingZone': instance.chargingZone,
      'chargePointEvse': instance.chargePointEvse,
      'chargePointId': instance.chargePointId,
      'name': instance.name,
      'evseDetails': instance.evseDetails,
    };

ChargePointEvseElement _$ChargePointEvseElementFromJson(
    Map<String, dynamic> json) {
  return ChargePointEvseElement(
    chargePointId: json['chargePointId'] as int?,
    chargeBox: json['chargeBox'] as String?,
    type: json['type'] as String?,
    typeDisplay: json['typeDisplay'] as String?,
    tariffId: json['tariffId'] as int?,
    reservationTariffId: json['reservationTariffId'],
    networkId: json['networkId'] as String?,
    maxPower: (json['maxPower'] as num?)?.toDouble(),
    tags: json['tags'],
    status: json['status'] as String?,
    statusDisplay: json['statusDisplay'] as String?,
    maxCurrent: (json['maxCurrent'] as num?)?.toDouble(),
    phases: json['phases'] as String?,
    phasesDisplay: json['phasesDisplay'] as String?,
    phaseRotation: json['phaseRotation'] as String?,
    phaseRotationDisplay: json['phaseRotationDisplay'] as String?,
    hardwareStatus: json['hardwareStatus'] as String?,
    hardwareStatusDisplay: json['hardwareStatusDisplay'] as String?,
    tariff: json['tariff'] == null
        ? null
        : Tariff.fromJson(json['tariff'] as Map<String, dynamic>),
    enableReservation: json['enableReservation'] as bool?,
    lastChargingSessionDate: json['lastChargingSessionDate'],
    lastChargingSessionId: json['lastChargingSessionId'] as int?,
    enableOtp: json['enableOtp'] as bool?,
    publicDiscountedTariffId: json['publicDiscountedTariffId'] as int?,
    chargePointEvseConnector: (json['chargePointEvseConnector']
            as List<dynamic>?)
        ?.map(
            (e) => ChargePointEvseConnector.fromJson(e as Map<String, dynamic>))
        .toList(),
    chargePointEvseId: json['chargePointEvseId'] as int?,
    qrCodeId: json['qrCodeId'] as int?,
  );
}

Map<String, dynamic> _$ChargePointEvseElementToJson(
        ChargePointEvseElement instance) =>
    <String, dynamic>{
      'chargePointId': instance.chargePointId,
      'chargeBox': instance.chargeBox,
      'type': instance.type,
      'typeDisplay': instance.typeDisplay,
      'tariffId': instance.tariffId,
      'reservationTariffId': instance.reservationTariffId,
      'networkId': instance.networkId,
      'maxPower': instance.maxPower,
      'tags': instance.tags,
      'status': instance.status,
      'statusDisplay': instance.statusDisplay,
      'maxCurrent': instance.maxCurrent,
      'phases': instance.phases,
      'phasesDisplay': instance.phasesDisplay,
      'phaseRotation': instance.phaseRotation,
      'phaseRotationDisplay': instance.phaseRotationDisplay,
      'hardwareStatus': instance.hardwareStatus,
      'hardwareStatusDisplay': instance.hardwareStatusDisplay,
      'tariff': instance.tariff,
      'enableReservation': instance.enableReservation,
      'lastChargingSessionDate': instance.lastChargingSessionDate,
      'lastChargingSessionId': instance.lastChargingSessionId,
      'enableOtp': instance.enableOtp,
      'publicDiscountedTariffId': instance.publicDiscountedTariffId,
      'chargePointEvseConnector': instance.chargePointEvseConnector,
      'chargePointEvseId': instance.chargePointEvseId,
      'qrCodeId': instance.qrCodeId,
    };

Tariff _$TariffFromJson(Map<String, dynamic> json) {
  return Tariff(
    tariffName: json['tariffName'] as String?,
    tariffDescription: json['tariffDescription'] as String?,
    tariffType: json['tariffType'] as String?,
    tariffTypeDisplay: json['tariffTypeDisplay'] as String?,
    connectionFee: (json['connectionFee'] as num?)?.toDouble(),
    gstPercentage: (json['gstPercentage'] as num?)?.toDouble(),
    paymentGatewayPercentage:
        (json['paymentGatewayPercentage'] as num?)?.toDouble(),
    tariffId: json['tariffId'] as int?,
  );
}

Map<String, dynamic> _$TariffToJson(Tariff instance) => <String, dynamic>{
      'tariffName': instance.tariffName,
      'tariffDescription': instance.tariffDescription,
      'tariffType': instance.tariffType,
      'tariffTypeDisplay': instance.tariffTypeDisplay,
      'connectionFee': instance.connectionFee,
      'gstPercentage': instance.gstPercentage,
      'paymentGatewayPercentage': instance.paymentGatewayPercentage,
      'tariffId': instance.tariffId,
    };

ChargePointEvseConnector _$ChargePointEvseConnectorFromJson(
    Map<String, dynamic> json) {
  return ChargePointEvseConnector(
    chargePointEvseId: json['chargePointEvseId'] as int?,
    type: json['type'] as String?,
    typeDisplay: json['typeDisplay'] as String?,
    typeResourceUrl: json['typeResourceUrl'] as String?,
    format: json['format'] as String?,
    formatDisplay: json['formatDisplay'] as String?,
    status: json['status'] as String?,
    statusDisplay: json['statusDisplay'] as String?,
    chargePointEvseConnectorId: json['chargePointEvseConnectorId'] as int?,
  );
}

Map<String, dynamic> _$ChargePointEvseConnectorToJson(
        ChargePointEvseConnector instance) =>
    <String, dynamic>{
      'chargePointEvseId': instance.chargePointEvseId,
      'type': instance.type,
      'typeDisplay': instance.typeDisplay,
      'typeResourceUrl': instance.typeResourceUrl,
      'format': instance.format,
      'formatDisplay': instance.formatDisplay,
      'status': instance.status,
      'statusDisplay': instance.statusDisplay,
      'chargePointEvseConnectorId': instance.chargePointEvseConnectorId,
    };

ChargingZone _$ChargingZoneFromJson(Map<String, dynamic> json) {
  return ChargingZone(
    status: json['status'] as String?,
    statusDisplay: json['statusDisplay'] as String?,
    locationId: json['locationId'] as int?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    chargingZoneId: json['chargingZoneId'] as int?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$ChargingZoneToJson(ChargingZone instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusDisplay': instance.statusDisplay,
      'locationId': instance.locationId,
      'title': instance.title,
      'description': instance.description,
      'location': instance.location,
      'chargingZoneId': instance.chargingZoneId,
      'name': instance.name,
    };

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    shortDescription: json['shortDescription'] as String?,
    detailedDescription: json['detailedDescription'] as String?,
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    threeWordsAddress: json['threeWordsAddress'],
    address: json['address'] as String?,
    postcode: json['postcode'] as String?,
    region: json['region'] as String?,
    city: json['city'] as String?,
    country: json['country'] as String?,
    locationImage: (json['locationImage'] as List<dynamic>?)
        ?.map((e) => LocationImage.fromJson(e as Map<String, dynamic>))
        .toList(),
    chargePointLocationId: json['chargePointLocationId'] as int?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'shortDescription': instance.shortDescription,
      'detailedDescription': instance.detailedDescription,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'threeWordsAddress': instance.threeWordsAddress,
      'address': instance.address,
      'postcode': instance.postcode,
      'region': instance.region,
      'city': instance.city,
      'country': instance.country,
      'locationImage': instance.locationImage,
      'chargePointLocationId': instance.chargePointLocationId,
      'name': instance.name,
    };

LocationImage _$LocationImageFromJson(Map<String, dynamic> json) {
  return LocationImage(
    imagePath: json['imagePath'] as String?,
  );
}

Map<String, dynamic> _$LocationImageToJson(LocationImage instance) =>
    <String, dynamic>{
      'imagePath': instance.imagePath,
    };

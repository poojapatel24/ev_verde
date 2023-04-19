import 'package:json_annotation/json_annotation.dart';
part 'response_chargedetailpoint.g.dart';
@JsonSerializable()
class ResponseChargeDetailPoint{
  ResponseChargeDetailPoint({
    this.data,
    this.errors,
    this.message,
    this.returnStatus,
  });

  Data? data;
  dynamic errors;
  String? message;
  bool? returnStatus;

  factory ResponseChargeDetailPoint.fromJson(Map<String, dynamic> json) => _$ResponseChargeDetailPointFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseChargeDetailPointToJson(this);
}

@JsonSerializable()
class Data{
  Data({
    this.chargingZoneId,
    this.manufactureDate,
    this.networkType,
    this.networkTypeDisplay,
    this.chargeBox,
    this.systemStatus,
    this.systemStatusDisplay,
    this.hardwareStatus,
    this.hardwareStatusDisplay,
    this.updatedDate,
    this.networkProtocol,
    this.networkProtocolDisplay,
    this.enableLocalAuthList,
    this.reservationSupport,
    this.createdDate,
    this.lastHeartbeatAt,
    this.heartbeatInterval,
    this.chargePointAvailablityCheckCount,
    this.landOwnerId,
    this.landOwnerName,
    this.msfId,
    this.msfName,
    this.sfId,
    this.sfName,
    this.distributorId,
    this.distributorName,
    this.dealerId,
    this.dealerName,
    this.landOwnerAgencyId,
    this.landOwnerAgencyName,
    this.msfPercentage,
    this.sfPercentage,
    this.distributorPercentage,
    this.dealerPercentage,
    //this.chargePointReservationTime,
    this.chargePointHarwareInfo,
    this.chargePointOwner,
    this.chargePointOwnerId,
    this.chargePointOwnerName,
    this.diagnosticLogPath,
    this.isDiagnosticLogsAvailable,
    this.connectionStatus,
    this.connectionStatusDisplay,
    this.chargingZoneName,
    this.isAccessible,
    this.isPublic,
    this.chargingZone,
    this.chargePointEvse,
    //this.amenities,
    this.chargePointId,
    this.name,
    this.evseDetails,
  });

  int? chargingZoneId;
  double? manufactureDate;
  String? networkType;
  String? networkTypeDisplay;
  String? chargeBox;
  String? systemStatus;
  String? systemStatusDisplay;
  String? hardwareStatus;
  dynamic hardwareStatusDisplay;
  double? updatedDate;
  String? networkProtocol;
  String? networkProtocolDisplay;
  bool? enableLocalAuthList;
  bool? reservationSupport;
  double? createdDate;
  double? lastHeartbeatAt;
  int? heartbeatInterval;
  String? chargePointAvailablityCheckCount;
  int? landOwnerId;
  String? landOwnerName;
  int? msfId;
  String? msfName;
  int? sfId;
  String? sfName;
  int? distributorId;
  String? distributorName;
  int? dealerId;
  String? dealerName;
  int? landOwnerAgencyId;
  String? landOwnerAgencyName;
  double? msfPercentage;
  double? sfPercentage;
  double? distributorPercentage;
  double? dealerPercentage;
  //List<ChargePointReservationTime>? chargePointReservationTime;
  String? chargePointHarwareInfo;
  String? chargePointOwner;
  int? chargePointOwnerId;
  String? chargePointOwnerName;
  dynamic diagnosticLogPath;
  bool? isDiagnosticLogsAvailable;
  String? connectionStatus;
  String? connectionStatusDisplay;
  String? chargingZoneName;
  bool? isAccessible;
  bool? isPublic;
  ChargingZone? chargingZone;
  List<ChargePointEvseElement>? chargePointEvse;
  //List<dynamic>? amenities;
  int? chargePointId;
  String? name;
  dynamic? evseDetails;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
@JsonSerializable()
class ChargePointEvseElement {
  ChargePointEvseElement({
    this.chargePointId,
    this.chargeBox,
    this.type,
    this.typeDisplay,
    this.tariffId,
    this.reservationTariffId,
    this.networkId,
    this.maxPower,
    this.tags,
    this.status,
    this.statusDisplay,
    this.maxCurrent,
    this.phases,
    this.phasesDisplay,
    this.phaseRotation,
    this.phaseRotationDisplay,
    this.hardwareStatus,
    this.hardwareStatusDisplay,
    this.tariff,
   // this.publicDiscountedTariff,
   // this.reservationTariff,
    this.enableReservation,
    this.lastChargingSessionDate,
    this.lastChargingSessionId,
    this.enableOtp,
    this.publicDiscountedTariffId,
    this.chargePointEvseConnector,
    this.chargePointEvseId,
    this.qrCodeId,
  });

  int? chargePointId;
  String? chargeBox;
  String? type;
  String? typeDisplay;
  int? tariffId;
  dynamic reservationTariffId;
  String? networkId;
  double? maxPower;
  dynamic tags;
  String? status;
  String? statusDisplay;
  double? maxCurrent;
  String? phases;
  String? phasesDisplay;
  String? phaseRotation;
  String? phaseRotationDisplay;
  String? hardwareStatus;
  String? hardwareStatusDisplay;
  Tariff? tariff;
  //Tariff publicDiscountedTariff;
  //dynamic reservationTariff;
  bool? enableReservation;
  dynamic lastChargingSessionDate;
  int? lastChargingSessionId;
  bool? enableOtp;
  int? publicDiscountedTariffId;
  List<ChargePointEvseConnector>? chargePointEvseConnector;
  int? chargePointEvseId;
  int? qrCodeId;

  factory ChargePointEvseElement.fromJson(Map<String, dynamic> json) => _$ChargePointEvseElementFromJson(json);
  Map<String, dynamic> toJson() => _$ChargePointEvseElementToJson(this);
}

@JsonSerializable()
class Tariff {
  Tariff({
    this.tariffName,
    this.tariffDescription,
    this.tariffType,
    this.tariffTypeDisplay,
    this.connectionFee,
    this.gstPercentage,
    this.paymentGatewayPercentage,
    this.tariffId,
  });

  String? tariffName;
  String? tariffDescription;
  String? tariffType;
  String? tariffTypeDisplay;
  double? connectionFee;
  double? gstPercentage;
  double? paymentGatewayPercentage;
  int? tariffId;

  factory Tariff.fromJson(Map<String, dynamic> json) => _$TariffFromJson(json);
  Map<String, dynamic> toJson() => _$TariffToJson(this);

}

@JsonSerializable()
class ChargePointEvseConnector {
  ChargePointEvseConnector({
    this.chargePointEvseId,
    this.type,
    this.typeDisplay,
    this.typeResourceUrl,
    this.format,
    this.formatDisplay,
    this.status,
    this.statusDisplay,
    //this.chargePointEvse,
    this.chargePointEvseConnectorId,
  });

  int? chargePointEvseId;
  String? type;
  String? typeDisplay;
  String? typeResourceUrl;
  String? format;
  String? formatDisplay;
  String? status;
  String? statusDisplay;
  //ChargePointEvseConnectorChargePointEvse chargePointEvse;
  int? chargePointEvseConnectorId;

  factory ChargePointEvseConnector.fromJson(Map<String, dynamic> json) => _$ChargePointEvseConnectorFromJson(json);
  Map<String, dynamic> toJson() => _$ChargePointEvseConnectorToJson(this);
}

@JsonSerializable()
class ChargingZone{
  ChargingZone({
    this.status,
    this.statusDisplay,
    this.locationId,
    this.title,
    this.description,
    this.location,
    this.chargingZoneId,
    this.name,
  });

  String? status;
  String? statusDisplay;
  int? locationId;
  String? title;
  String? description;
  Location? location;
  int? chargingZoneId;
  String? name;

  factory ChargingZone.fromJson(Map<String, dynamic> json) => _$ChargingZoneFromJson(json);
  Map<String, dynamic> toJson() => _$ChargingZoneToJson(this);
}

@JsonSerializable()
class Location{
  Location({
    this.shortDescription,
    this.detailedDescription,
    this.latitude,
    this.longitude,
    this.threeWordsAddress,
    this.address,
    this.postcode,
    this.region,
    this.city,
    this.country,
    this.locationImage,
    this.chargePointLocationId,
    this.name,
  });

  String? shortDescription;
  String? detailedDescription;
  double? latitude;
  double? longitude;
  dynamic threeWordsAddress;
  String? address;
  String? postcode;
  String? region;
  String? city;
  String? country;
  List<LocationImage>? locationImage;
  int? chargePointLocationId;
  String? name;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class LocationImage{
  LocationImage({
    this.imagePath,
  });

  String? imagePath;

  factory LocationImage.fromJson(Map<String, dynamic> json) => _$LocationImageFromJson(json);
  Map<String, dynamic> toJson() => _$LocationImageToJson(this);
}

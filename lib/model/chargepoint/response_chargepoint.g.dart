// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_chargepoint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseChargePoint _$ResponseChargePointFromJson(Map<String, dynamic> json) {
  return ResponseChargePoint(
    noOfRecords: json['noOfRecords'] as int?,
    data: (json['data'] as List<dynamic>)
        .map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList(),
    errors: json['errors'],
    message: json['message'] as String?,
    returnStatus: json['returnStatus'] as bool?,
  );
}

Map<String, dynamic> _$ResponseChargePointToJson(
        ResponseChargePoint instance) =>
    <String, dynamic>{
      'noOfRecords': instance.noOfRecords,
      'data': instance.data,
      'errors': instance.errors,
      'message': instance.message,
      'returnStatus': instance.returnStatus,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    chargePointId: json['chargePointId'] as int,
    name: json['name'] as String,
    latitude: (json['latitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
    available: json['available'] as bool,
    noOfConnectors: json['noOfConnectors'] as int,
    isPublic: json['isPublic'] as bool,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'chargePointId': instance.chargePointId,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'available': instance.available,
      'noOfConnectors': instance.noOfConnectors,
      'isPublic': instance.isPublic,
    };

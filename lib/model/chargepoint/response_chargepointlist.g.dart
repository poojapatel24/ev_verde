// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_chargepointlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseChargePointList _$ResponseChargePointListFromJson(
    Map<String, dynamic> json) {
  return ResponseChargePointList(
    noOfRecords: json['noOfRecords'] as int?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList(),
    errors: json['errors'],
    message: json['message'] as String?,
    returnStatus: json['returnStatus'] as bool?,
  );
}

Map<String, dynamic> _$ResponseChargePointListToJson(
        ResponseChargePointList instance) =>
    <String, dynamic>{
      'noOfRecords': instance.noOfRecords,
      'data': instance.data,
      'errors': instance.errors,
      'message': instance.message,
      'returnStatus': instance.returnStatus,
    };

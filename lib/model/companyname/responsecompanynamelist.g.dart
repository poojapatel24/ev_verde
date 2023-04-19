// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsecompanynamelist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseCompanyNameList _$ResponseCompanyNameListFromJson(
    Map<String, dynamic> json) {
  return ResponseCompanyNameList(
    noOfRecords: json['noOfRecords'] as int?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList(),
    errors: json['errors'],
    message: json['message'] as String?,
    returnStatus: json['returnStatus'] as bool?,
  );
}

Map<String, dynamic> _$ResponseCompanyNameListToJson(
        ResponseCompanyNameList instance) =>
    <String, dynamic>{
      'noOfRecords': instance.noOfRecords,
      'data': instance.data,
      'errors': instance.errors,
      'message': instance.message,
      'returnStatus': instance.returnStatus,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    vehicleCompanyName: json['vehicleCompanyName'] as String?,
    vehicleCompanyId: json['vehicleCompanyId'] as int?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'vehicleCompanyName': instance.vehicleCompanyName,
      'vehicleCompanyId': instance.vehicleCompanyId,
    };

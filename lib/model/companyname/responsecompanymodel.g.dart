// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsecompanymodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseCompanyModel _$ResponseCompanyModelFromJson(Map<String, dynamic> json) {
  return ResponseCompanyModel(
    noOfRecords: json['noOfRecords'] as int?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Datam.fromJson(e as Map<String, dynamic>))
        .toList(),
    errors: json['errors'],
    message: json['message'] as String?,
    returnStatus: json['returnStatus'] as bool?,
  );
}

Map<String, dynamic> _$ResponseCompanyModelToJson(
        ResponseCompanyModel instance) =>
    <String, dynamic>{
      'noOfRecords': instance.noOfRecords,
      'data': instance.data,
      'errors': instance.errors,
      'message': instance.message,
      'returnStatus': instance.returnStatus,
    };

Datam _$DatamFromJson(Map<String, dynamic> json) {
  return Datam(
    vehicleModelId: json['vehicleModelId'] as int?,
    modelName: json['modelName'] as String?,
    vehicleCompanyId: json['vehicleCompanyId'] as int?,
    modelImageUrl: json['modelImageUrl'],
  );
}

Map<String, dynamic> _$DatamToJson(Datam instance) => <String, dynamic>{
      'vehicleModelId': instance.vehicleModelId,
      'modelName': instance.modelName,
      'vehicleCompanyId': instance.vehicleCompanyId,
      'modelImageUrl': instance.modelImageUrl,
    };

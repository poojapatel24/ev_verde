// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDevice _$ResponseDeviceFromJson(Map<String, dynamic> json) {
  return ResponseDevice(
    data: json['data'] as String?,
    errors: json['errors'],
    message: json['message'] as String?,
    returnStatus: json['returnStatus'] as bool?,
  );
}

Map<String, dynamic> _$ResponseDeviceToJson(ResponseDevice instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errors': instance.errors,
      'message': instance.message,
      'returnStatus': instance.returnStatus,
    };

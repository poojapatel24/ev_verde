// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestDevice _$RequestDeviceFromJson(Map<String, dynamic> json) {
  return RequestDevice(
    appId: json['appId'] as String?,
    clientKey: json['clientKey'] as String?,
    platform: json['platform'] as String?,
    manufacturer: json['manufacturer'] as String?,
    model: json['model'] as String?,
    appVersion: json['appVersion'] as String?,
    appBuild: json['appBuild'] as String?,
    timeZoneOffset: json['timeZoneOffset'] as String?,
  );
}

Map<String, dynamic> _$RequestDeviceToJson(RequestDevice instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'clientKey': instance.clientKey,
      'platform': instance.platform,
      'manufacturer': instance.manufacturer,
      'model': instance.model,
      'appVersion': instance.appVersion,
      'appBuild': instance.appBuild,
      'timeZoneOffset': instance.timeZoneOffset,
    };

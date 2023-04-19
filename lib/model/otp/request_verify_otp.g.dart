// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_verify_otp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestVerifyOtp _$RequestVerifyOtpFromJson(Map<String, dynamic> json) {
  return RequestVerifyOtp(
    phone: json['phone'] as String?,
    otp: json['otp'] as String?,
    clientKey: json['clientKey'] as String?,
    appId: json['appId'] as String?,
  );
}

Map<String, dynamic> _$RequestVerifyOtpToJson(RequestVerifyOtp instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'otp': instance.otp,
      'clientKey': instance.clientKey,
      'appId': instance.appId,
    };

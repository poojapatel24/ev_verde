// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_generate_otp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestGenerateOtp _$RequestGenerateOtpFromJson(Map<String, dynamic> json) {
  return RequestGenerateOtp(
    phone: json['phone'] as String?,
    countryId: json['countryId'] as int?,
    otpType: json['otpType'] as String?,
    email: json['email'] as String?,
    clientKey: json['clientKey'] as String?,
  );
}

Map<String, dynamic> _$RequestGenerateOtpToJson(RequestGenerateOtp instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'countryId': instance.countryId,
      'otpType': instance.otpType,
      'email': instance.email,
      'clientKey': instance.clientKey,
    };

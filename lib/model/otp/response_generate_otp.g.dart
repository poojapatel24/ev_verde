// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_generate_otp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGenerateOtp _$ResponseGenerateOtpFromJson(Map<String, dynamic> json) {
  return ResponseGenerateOtp(
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    errors: json['errors'],
    message: json['message'] as String?,
    returnStatus: json['returnStatus'] as bool?,
  );
}

Map<String, dynamic> _$ResponseGenerateOtpToJson(
        ResponseGenerateOtp instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errors': instance.errors,
      'message': instance.message,
      'returnStatus': instance.returnStatus,
    };

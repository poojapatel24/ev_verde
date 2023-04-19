// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resposne_verify_otp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseVerifyOtp _$ResponseVerifyOtpFromJson(Map<String, dynamic> json) {
  return ResponseVerifyOtp(
    errors: json['errors'],
    message: json['message'] as String?,
    returnStatus: json['returnStatus'] as bool?,
  );
}

Map<String, dynamic> _$ResponseVerifyOtpToJson(ResponseVerifyOtp instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'returnStatus': instance.returnStatus,
    };

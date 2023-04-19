// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_signup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseSignup _$ResponseSignupFromJson(Map<String, dynamic> json) {
  return ResponseSignup(
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    errors: json['errors'],
    message: json['message'] as String?,
    returnStatus: json['returnStatus'] as bool?,
  );
}

Map<String, dynamic> _$ResponseSignupToJson(ResponseSignup instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errors': instance.errors,
      'message': instance.message,
      'returnStatus': instance.returnStatus,
    };

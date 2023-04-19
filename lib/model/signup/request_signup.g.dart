// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_signup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestSignup _$RequestSignupFromJson(Map<String, dynamic> json) {
  return RequestSignup(
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    phone: json['phone'] as String?,
    countryId: json['countryId'] as int?,
    clientKey: json['clientKey'] as String?,
    appId: json['appId'] as String?,
  );
}

Map<String, dynamic> _$RequestSignupToJson(RequestSignup instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'countryId': instance.countryId,
      'clientKey': instance.clientKey,
      'appId': instance.appId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestLogin _$RequestLoginFromJson(Map<String, dynamic> json) {
  return RequestLogin(
    emailOrPhone: json['emailOrPhone'] as String,
    password: json['password'] as String,
    clientKey: json['clientKey'] as String?,
    appId: json['appId'] as String?,
  );
}

Map<String, dynamic> _$RequestLoginToJson(RequestLogin instance) =>
    <String, dynamic>{
      'emailOrPhone': instance.emailOrPhone,
      'password': instance.password,
      'clientKey': instance.clientKey,
      'appId': instance.appId,
    };

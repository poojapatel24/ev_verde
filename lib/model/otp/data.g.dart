// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    otpExpiresInSeconds: json['otpExpiresInSeconds'] as int?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'otpExpiresInSeconds': instance.otpExpiresInSeconds,
    };

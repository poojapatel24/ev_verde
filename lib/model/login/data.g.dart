// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    isPhoneVerified: json['isPhoneVerified'] as bool?,
    mobileNumber: json['mobileNumber'] as String?,
    loginResponse: json['loginResponse'] == null
        ? null
        : LoginResponse.fromJson(json['loginResponse'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'isPhoneVerified': instance.isPhoneVerified,
      'mobileNumber': instance.mobileNumber,
      'loginResponse': instance.loginResponse,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    accessToken: json['accessToken'] as String?,
    tokenType: json['tokenType'] as String?,
    refreshToken: json['refreshToken'] as String?,
    accessTokenExpiryEpochTime:
        (json['accessTokenExpiryEpochTime'] as num?)?.toDouble(),
    role: json['role'] as String?,
    channelName: json['channelName'],
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    emailAddress: json['emailAddress'] as String?,
    clientKey: json['clientKey'] as String?,
    userKey: json['userKey'] as String?,
    profileImageUrl: json['profileImageUrl'] as String?,
    profileImageThumbUrl: json['profileImageThumbUrl'] as String?,
    currencySymbol: json['currencySymbol'] as String?,
    currencyCode: json['currencyCode'] as String?,
    partnerKey: json['partnerKey'],
    ocppClientName: json['ocppClientName'] as String?,
    clientLogoFilePath: json['clientLogoFilePath'] as String?,
    countryId: json['countryId'] as int?,
    phone: json['phone'] as String?,
    portalUrl: json['portalUrl'] as String?,
    channelType: json['channelType'],
    channelId: json['channelId'],
    ocppBaseUrl: json['ocppBaseUrl'] as String?,
    accessLevel: json['accessLevel'],
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'tokenType': instance.tokenType,
      'refreshToken': instance.refreshToken,
      'accessTokenExpiryEpochTime': instance.accessTokenExpiryEpochTime,
      'role': instance.role,
      'channelName': instance.channelName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'emailAddress': instance.emailAddress,
      'clientKey': instance.clientKey,
      'userKey': instance.userKey,
      'profileImageUrl': instance.profileImageUrl,
      'profileImageThumbUrl': instance.profileImageThumbUrl,
      'currencySymbol': instance.currencySymbol,
      'currencyCode': instance.currencyCode,
      'partnerKey': instance.partnerKey,
      'ocppClientName': instance.ocppClientName,
      'clientLogoFilePath': instance.clientLogoFilePath,
      'countryId': instance.countryId,
      'phone': instance.phone,
      'portalUrl': instance.portalUrl,
      'channelType': instance.channelType,
      'channelId': instance.channelId,
      'ocppBaseUrl': instance.ocppBaseUrl,
      'accessLevel': instance.accessLevel,
    };

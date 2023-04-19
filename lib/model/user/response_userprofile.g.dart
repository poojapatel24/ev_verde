// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_userprofile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseUserProfile _$ResponseUserProfileFromJson(Map<String, dynamic> json) {
  return ResponseUserProfile(
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    errors: json['errors'],
    message: json['message'] as String?,
    returnStatus: json['returnStatus'] as bool?,
  );
}

Map<String, dynamic> _$ResponseUserProfileToJson(
        ResponseUserProfile instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errors': instance.errors,
      'message': instance.message,
      'returnStatus': instance.returnStatus,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    country: json['country'] as String?,
    city: json['city'],
    postalCode: json['postalCode'],
    address: json['address'],
    countryId: json['countryId'] as int?,
    alpha2: json['alpha2'] as String?,
    isPhoneVerified: json['isPhoneVerified'] as bool?,
    isEmailVerified: json['isEmailVerified'] as bool?,
    profileImageUrl: json['profileImageUrl'],
    profileImageThumbUrl: json['profileImageThumbUrl'],
    userSetting: json['userSetting'],
    favouriteChargePoint: json['favouriteChargePoint'] as List<dynamic>?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'country': instance.country,
      'city': instance.city,
      'postalCode': instance.postalCode,
      'address': instance.address,
      'countryId': instance.countryId,
      'alpha2': instance.alpha2,
      'isPhoneVerified': instance.isPhoneVerified,
      'isEmailVerified': instance.isEmailVerified,
      'profileImageUrl': instance.profileImageUrl,
      'profileImageThumbUrl': instance.profileImageThumbUrl,
      'userSetting': instance.userSetting,
      'favouriteChargePoint': instance.favouriteChargePoint,
    };

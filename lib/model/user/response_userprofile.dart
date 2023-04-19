import 'package:json_annotation/json_annotation.dart';
part 'response_userprofile.g.dart';
@JsonSerializable()
class ResponseUserProfile{
  ResponseUserProfile({
    this.data,
    this.errors,
    this.message,
    this.returnStatus,
  });

  Data? data;
  dynamic errors;
  String? message;
  bool? returnStatus;

  factory ResponseUserProfile.fromJson(Map<String, dynamic> json) => _$ResponseUserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseUserProfileToJson(this);
}
@JsonSerializable()
class Data{
  Data({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.country,
    this.city,
    this.postalCode,
    this.address,
    this.countryId,
    this.alpha2,
    this.isPhoneVerified,
    this.isEmailVerified,
    this.profileImageUrl,
    this.profileImageThumbUrl,
    this.userSetting,
    this.favouriteChargePoint,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? country;
  dynamic city;
  dynamic postalCode;
  dynamic address;
  int? countryId;
  String? alpha2;
  bool? isPhoneVerified;
  bool? isEmailVerified;
  dynamic profileImageUrl;
  dynamic profileImageThumbUrl;
  dynamic userSetting;
  List<dynamic>? favouriteChargePoint;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
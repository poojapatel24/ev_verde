import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';
@JsonSerializable()
class Data{
  Data({
    this.isPhoneVerified,
    this.mobileNumber,
    this.loginResponse,
  });

  bool? isPhoneVerified;
  String? mobileNumber;
  LoginResponse? loginResponse;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class LoginResponse {
  LoginResponse({
    this.accessToken,
    this.tokenType,
    this.refreshToken,
    this.accessTokenExpiryEpochTime,
    this.role,
    this.channelName,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.clientKey,
    this.userKey,
    this.profileImageUrl,
    this.profileImageThumbUrl,
    this.currencySymbol,
    this.currencyCode,
    this.partnerKey,
    this.ocppClientName,
    this.clientLogoFilePath,
    this.countryId,
    this.phone,
    this.portalUrl,
    this.channelType,
    this.channelId,
    this.ocppBaseUrl,
    this.accessLevel,
  });

  String? accessToken;
  String? tokenType;
  String? refreshToken;
  double? accessTokenExpiryEpochTime;
  String? role;
  dynamic channelName;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? clientKey;
  String? userKey;
  String? profileImageUrl;
  String? profileImageThumbUrl;
  String? currencySymbol;
  String? currencyCode;
  dynamic partnerKey;
  String? ocppClientName;
  String? clientLogoFilePath;
  int? countryId;
  String? phone;
  String? portalUrl;
  dynamic channelType;
  dynamic channelId;
  String? ocppBaseUrl;
  dynamic accessLevel;


  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
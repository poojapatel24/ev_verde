import 'package:json_annotation/json_annotation.dart';
part 'request_signup.g.dart';
@JsonSerializable()
class RequestSignup{
  RequestSignup({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.countryId,
    this.clientKey,
    this.appId,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  int? countryId;
  String? clientKey;
  String? appId;

  factory RequestSignup.fromJson(Map<String, dynamic> json) => _$RequestSignupFromJson(json);
  Map<String, dynamic> toJson() => _$RequestSignupToJson(this);
}
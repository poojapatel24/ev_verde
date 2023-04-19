import 'package:json_annotation/json_annotation.dart';
part 'request_generate_otp.g.dart';
@JsonSerializable()
class RequestGenerateOtp {
  RequestGenerateOtp({
    this.phone,
    this.countryId,
    this.otpType,
    this.email,
    this.clientKey,
  });

  String? phone;
  int? countryId;
  String? otpType;
  String? email;
  String? clientKey;


  factory RequestGenerateOtp.fromJson(Map<String, dynamic> json) => _$RequestGenerateOtpFromJson(json);
  Map<String, dynamic> toJson() => _$RequestGenerateOtpToJson(this);
}
import 'package:json_annotation/json_annotation.dart';
part 'request_verify_otp.g.dart';
@JsonSerializable()
class RequestVerifyOtp {
  RequestVerifyOtp({
    this.phone,
    this.otp,
    this.clientKey,
    this.appId,
  });

  String? phone;
  String? otp;
  String? clientKey;
  String? appId;

  factory RequestVerifyOtp.fromJson(Map<String, dynamic> json) => _$RequestVerifyOtpFromJson(json);
  Map<String, dynamic> toJson() => _$RequestVerifyOtpToJson(this);
}
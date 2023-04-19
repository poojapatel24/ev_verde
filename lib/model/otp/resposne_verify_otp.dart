import 'package:json_annotation/json_annotation.dart';
part 'resposne_verify_otp.g.dart';
@JsonSerializable()
class ResponseVerifyOtp {
  ResponseVerifyOtp({
    this.errors,
    this.message,
    this.returnStatus,
  });

  dynamic errors;
  String? message;
  bool? returnStatus;

  factory ResponseVerifyOtp.fromJson(Map<String, dynamic> json) => _$ResponseVerifyOtpFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseVerifyOtpToJson(this);
}
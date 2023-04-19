import 'package:json_annotation/json_annotation.dart';

import 'data.dart';
part 'response_generate_otp.g.dart';
@JsonSerializable()
class ResponseGenerateOtp {
  ResponseGenerateOtp({
    this.data,
    this.errors,
    this.message,
    this.returnStatus,
  });
  Data? data;
  dynamic errors;
  String? message;
  bool? returnStatus;

  factory ResponseGenerateOtp.fromJson(Map<String, dynamic> json) => _$ResponseGenerateOtpFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseGenerateOtpToJson(this);
}
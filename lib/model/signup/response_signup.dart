import 'package:json_annotation/json_annotation.dart';

import 'data.dart';
part 'response_signup.g.dart';
@JsonSerializable()
class ResponseSignup{
  ResponseSignup({
    this.data,
    this.errors,
    this.message,
    this.returnStatus,
  });
  Data? data;
  dynamic errors;
  String? message;
  bool? returnStatus;


  factory ResponseSignup.fromJson(Map<String, dynamic> json) => _$ResponseSignupFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseSignupToJson(this);
}
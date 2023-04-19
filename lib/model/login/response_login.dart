import 'package:json_annotation/json_annotation.dart';

import 'data.dart';
part 'response_login.g.dart';
@JsonSerializable()
class ResponseLogin{
  ResponseLogin({
    this.data,
    this.errors,
    this.message,
    this.returnStatus,
  });
  Data? data;
  dynamic errors;
  String? message;
  bool? returnStatus;


  factory ResponseLogin.fromJson(Map<String, dynamic> json) => _$ResponseLoginFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseLoginToJson(this);
}
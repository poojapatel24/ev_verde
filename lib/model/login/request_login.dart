
import 'package:json_annotation/json_annotation.dart';
part 'request_login.g.dart';
@JsonSerializable()
class RequestLogin{
  RequestLogin({
    required this.emailOrPhone,
    required this.password,
    this.clientKey,
    this.appId,
  });

  String emailOrPhone;
  String password;
  String? clientKey;
  String? appId;

  factory RequestLogin.fromJson(Map<String, dynamic> json) => _$RequestLoginFromJson(json);
  Map<String, dynamic> toJson() => _$RequestLoginToJson(this);
}
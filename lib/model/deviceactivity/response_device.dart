import 'package:json_annotation/json_annotation.dart';
part 'response_device.g.dart';
@JsonSerializable()
class ResponseDevice{
  ResponseDevice({
    this.data,
    this.errors,
    this.message,
    this.returnStatus,
  });

  String? data;
  dynamic errors;
  String? message;
  bool? returnStatus;

  factory ResponseDevice.fromJson(Map<String, dynamic> json) => _$ResponseDeviceFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDeviceToJson(this);
}
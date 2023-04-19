import 'package:json_annotation/json_annotation.dart';
part 'request_device.g.dart';
@JsonSerializable()
class RequestDevice{
  RequestDevice({
    this.appId,
    this.clientKey,
    this.platform,
    this.manufacturer,
    this.model,
    this.appVersion,
    this.appBuild,
    this.timeZoneOffset,
  });

  String? appId;
  String? clientKey;
  String? platform;
  String? manufacturer;
  String? model;
  String? appVersion;
  String? appBuild;
  String? timeZoneOffset;

  factory RequestDevice.fromJson(Map<String, dynamic> json) => _$RequestDeviceFromJson(json);
  Map<String, dynamic> toJson() => _$RequestDeviceToJson(this);
}
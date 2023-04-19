import 'package:json_annotation/json_annotation.dart';
part 'response_chargepoint.g.dart';
@JsonSerializable()
class ResponseChargePoint{
  ResponseChargePoint({
    this.noOfRecords,
    required this.data,
    this.errors,
    this.message,
    this.returnStatus,
  });

  int? noOfRecords;
  List<Data> data;
  dynamic errors;
  String? message;
  bool? returnStatus;

  factory ResponseChargePoint.fromJson(Map<String, dynamic> json) => _$ResponseChargePointFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseChargePointToJson(this);
}

@JsonSerializable()
class Data{
  Data({
    required this.chargePointId,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.available,
    required this.noOfConnectors,
    required this.isPublic,
  });

  int chargePointId;
  String name;
  double latitude;
  double longitude;
  bool available;
  int noOfConnectors;
  bool isPublic;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
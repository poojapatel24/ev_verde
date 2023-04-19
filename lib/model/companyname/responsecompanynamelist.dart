import 'package:json_annotation/json_annotation.dart';

part 'responsecompanynamelist.g.dart';

@JsonSerializable()
class ResponseCompanyNameList {
  ResponseCompanyNameList({
    this.noOfRecords,
    this.data,
    this.errors,
    this.message,
    this.returnStatus,
  });

  int? noOfRecords;
  List<Data>? data;
  dynamic errors;
  String? message;
  bool? returnStatus;

  factory ResponseCompanyNameList.fromJson(Map<String, dynamic> json) => _$ResponseCompanyNameListFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseCompanyNameListToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.vehicleCompanyName,
    this.vehicleCompanyId,
  });

  String? vehicleCompanyName;
  int? vehicleCompanyId;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
part 'responsecompanymodel.g.dart';
@JsonSerializable()
class ResponseCompanyModel{
  ResponseCompanyModel({
    this.noOfRecords,
    this.data,
    this.errors,
    this.message,
    this.returnStatus,
  });

  int? noOfRecords;
  List<Datam>? data;
  dynamic errors;
  String? message;
  bool? returnStatus;


  factory ResponseCompanyModel.fromJson(Map<String, dynamic> json) => _$ResponseCompanyModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseCompanyModelToJson(this);
}
@JsonSerializable()
class Datam{
  Datam({
    this.vehicleModelId,
    this.modelName,
    this.vehicleCompanyId,
    this.modelImageUrl,
    //this.connectorType,
  });

  int? vehicleModelId;
  String? modelName;
  int? vehicleCompanyId;
  dynamic modelImageUrl;
 // List<ConnectorType> connectorType;

  factory Datam.fromJson(Map<String, dynamic> json) => _$DatamFromJson(json);
  Map<String, dynamic> toJson() => _$DatamToJson(this);
}
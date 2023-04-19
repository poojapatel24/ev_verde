import 'package:ev_verde/model/chargepoint/response_chargedetailpoint.dart';
import 'package:json_annotation/json_annotation.dart';
part 'response_chargepointlist.g.dart';
@JsonSerializable()
class ResponseChargePointList{
  ResponseChargePointList({
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
  factory ResponseChargePointList.fromJson(Map<String, dynamic> json) => _$ResponseChargePointListFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseChargePointListToJson(this);
}
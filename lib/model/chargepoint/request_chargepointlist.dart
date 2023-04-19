import 'package:json_annotation/json_annotation.dart';
part 'request_chargepointlist.g.dart';
@JsonSerializable()
class RequestChargePointList{
  RequestChargePointList({
    this.chargePointIdList,
  });

  List<int>? chargePointIdList;

  factory RequestChargePointList.fromJson(Map<String, dynamic> json) => _$RequestChargePointListFromJson(json);
  Map<String, dynamic> toJson() => _$RequestChargePointListToJson(this);
}

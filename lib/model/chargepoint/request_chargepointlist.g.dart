// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_chargepointlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestChargePointList _$RequestChargePointListFromJson(
    Map<String, dynamic> json) {
  return RequestChargePointList(
    chargePointIdList: (json['chargePointIdList'] as List<dynamic>?)
        ?.map((e) => e as int)
        .toList(),
  );
}

Map<String, dynamic> _$RequestChargePointListToJson(
        RequestChargePointList instance) =>
    <String, dynamic>{
      'chargePointIdList': instance.chargePointIdList,
    };

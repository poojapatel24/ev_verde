import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';
@JsonSerializable()
class Data{
  Data({
    this.phone,
  });
  String? phone;


  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
import 'package:json_annotation/json_annotation.dart';
part 'dates_vo.g.dart';
@JsonSerializable()
class DatesVO{
  @JsonKey(name: "maximum")
  String? maximum;
  @JsonKey(name: "minimum")
  String? minimum;

  DatesVO(this.maximum, this.minimum);
  factory DatesVO.fromJson(Map<String,dynamic> json) => _$DatesVOFromJson(json);
}
import 'package:json_annotation/json_annotation.dart';

part 'job_entity.g.dart';

@JsonSerializable()
class JobEntity {
  final String id;

  @JsonKey(name: "title",defaultValue: '')
  final String title;
  @JsonKey(defaultValue: 'slugEmpty',)
  final String slug;

  JobEntity({this.id, this.title, this.slug});


  factory JobEntity.fromJson(Map<String, dynamic> json) =>
      _$JobEntityFromJson(json);

  Map<String, dynamic> toJson() => _$JobEntityToJson(this);
}

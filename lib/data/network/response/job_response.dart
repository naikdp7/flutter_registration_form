import 'package:json_annotation/json_annotation.dart';
import 'package:registration_form/data/network/entity/job_entity.dart';
import 'package:registration_form/data/network/entity/province.dart';
import 'package:registration_form/domain/model/job.dart';
import 'package:registration_form/domain/utils/base_tranformer.dart';

part 'job_response.g.dart';

@JsonSerializable()
class JobResponse extends BaseTransformer<JobResponse, List<Job>> {
  @JsonKey(name: 'error', defaultValue: false, includeIfNull: false)
  bool error;

  @JsonKey(name: 'message', defaultValue: "", includeIfNull: false)
  String message;

  List<JobEntity> jobs;

  @JsonKey(name: 'errorCode', defaultValue: "", includeIfNull: false)
  String errorCode;

  @JsonKey(defaultValue: [])
  List<ProvinceEntity> province;

  JobResponse({this.jobs, this.error: false, this.message: ""});

  @override
  JobResponse restore(List<Job> jobs) {
    return JobResponse(
      jobs: jobs
          .map(
            (e) => JobEntity(id: e.id, title: e.title, slug: e.slug),
          )
          .toList(),
    );
  }

  @override
  List<Job> transform() {
    return this
        .jobs
        .map(
          (e) => Job(id: e.id, title: e.title, slug: e.slug),
        )
        .toList();
  }

  factory JobResponse.fromJson(Map<String, dynamic> json) =>
      _$JobResponseFromJson(json);

  Map<String, dynamic> toJson() => _$JobResponseToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobResponse _$JobResponseFromJson(Map<String, dynamic> json) {
  return JobResponse(
    jobs: (json['jobs'] as List)
        ?.map((e) =>
            e == null ? null : JobEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    error: json['error'] as bool ?? false,
    message: json['message'] as String ?? '',
  )
    ..errorCode = json['errorCode'] as String ?? ''
    ..province = (json['province'] as List)
            ?.map((e) => e == null
                ? null
                : ProvinceEntity.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [];
}

Map<String, dynamic> _$JobResponseToJson(JobResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error', instance.error);
  writeNotNull('message', instance.message);
  val['jobs'] = instance.jobs;
  writeNotNull('errorCode', instance.errorCode);
  val['province'] = instance.province;
  return val;
}

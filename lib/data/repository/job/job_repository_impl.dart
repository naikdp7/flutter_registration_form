import 'dart:io';

import 'package:registration_form/data/source/job/remote/job_remote_repository_ds.dart';
import 'package:registration_form/domain/model/job.dart';
import 'package:registration_form/domain/repository/job/job_repository.dart';
import 'package:registration_form/domain/utils/resource.dart';

class JobRepositoryImpl extends JobRepository {
  final JobRemoteRepositoryDataSource _jobRemoteRepositoryDataSource;

  JobRepositoryImpl(this._jobRemoteRepositoryDataSource);

  @override
  Future<Resource<List<Job>>> getJobs() async {
    try {
      final response = await _jobRemoteRepositoryDataSource.getJobs();
      print('Response ${response.toJson()}');
      switch (response.error) {
        case false:
          return Resource.success<List<Job>>(data: response.transform());
        case true:
        default:
          return Resource.error<List<Job>>(
            error: response.message,
            code: parseError(response.errorCode),
          );
      }
    } on Exception catch (e) {
      if (e is HttpException) {
        return Resource.error<List<Job>>(
            error: "Network Error", code: StatusCode.NETWORK_ERROR);
      } else {
        return Resource.error<List<Job>>(
            error: "General Error", code: StatusCode.GENERAL_ERROR);
      }
    }
  }
}

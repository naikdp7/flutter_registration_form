import 'package:registration_form/data/network/response/job_response.dart';
import 'package:registration_form/data/network/service/graphql/job_service.dart';
import 'package:registration_form/data/source/job/job_repository_ds.dart';

class JobRemoteRepositoryDataSource extends JobRepoRemoteDataSource {
  final JobService _jobService;

  JobRemoteRepositoryDataSource(this._jobService);

  @override
  Future<JobResponse> getJobs() async {
    return _jobService.getJobs();
  }
}

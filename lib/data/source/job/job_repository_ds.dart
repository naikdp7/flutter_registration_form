import 'package:registration_form/data/network/response/job_response.dart';
abstract class JobRepoRemoteDataSource {
  Future<JobResponse> getJobs();
}

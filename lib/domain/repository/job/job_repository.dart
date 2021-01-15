import 'package:registration_form/domain/model/job.dart';
import 'package:registration_form/domain/utils/resource.dart';

abstract class JobRepository {
  Future<Resource<List<Job>>> getJobs();
}
import 'package:registration_form/domain/model/job.dart';
import 'package:registration_form/domain/utils/resource.dart';

import '../province/province_respository.dart';

abstract class JobRepository extends BaseRepository {
  Future<Resource<List<Job>>> getJobs();
}

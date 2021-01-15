import 'package:registration_form/domain/model/job.dart';
import 'package:registration_form/domain/repository/job/job_repository.dart';
import 'package:registration_form/domain/usecase/baseusecase.dart';
import 'package:registration_form/domain/utils/resource.dart';

class FetchJobUseCase extends BaseUseCase {
  final JobRepository _jobRepository;

  FetchJobUseCase(this._jobRepository);

  @override
  Future<Resource<List<Job>>> execute({params}) {
    return _jobRepository.getJobs();
  }
}

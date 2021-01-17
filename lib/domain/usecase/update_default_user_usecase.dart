import 'package:registration_form/domain/model/user.dart';
import 'package:registration_form/domain/repository/user/user_repository.dart';
import 'package:registration_form/domain/usecase/baseusecase.dart';
import 'package:registration_form/domain/utils/resource.dart';

class UpdateDefaultUserUseCase extends BaseUseCase {
  final UserRepository _userRepository;

  UpdateDefaultUserUseCase(this._userRepository);

  @override
  Future<Resource<bool>> execute({params}) {
    return _userRepository.updateDefaultUser(params);
  }
}

class UpdateDefaultUserUseCaseParam extends BaseUseCaseParam {
  final User user;

  UpdateDefaultUserUseCaseParam(this.user);
}

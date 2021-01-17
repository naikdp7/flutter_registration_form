import 'package:registration_form/domain/model/user.dart';
import 'package:registration_form/domain/repository/user/user_repository.dart';
import 'package:registration_form/domain/usecase/baseusecase.dart';
import 'package:registration_form/domain/utils/resource.dart';

class AddUserUseCase extends BaseUseCase {
  final UserRepository _userRepository;

  AddUserUseCase(this._userRepository);

  @override
  Future<Resource<bool>> execute({params}) {
    return _userRepository.addUser(params);
  }
}

class AddUserUseCaseParam extends BaseUseCaseParam {
  final User user;

  AddUserUseCaseParam(this.user);
}

import 'package:registration_form/domain/model/user.dart';
import 'package:registration_form/domain/repository/user/user_repository.dart';
import 'package:registration_form/domain/usecase/baseusecase.dart';
import 'package:registration_form/domain/utils/resource.dart';

class GetCurrentUserUseCase extends BaseUseCase {
  final UserRepository _userRepository;

  GetCurrentUserUseCase(this._userRepository);

  @override
  Future<Resource<User>> execute({params}) {
    return _userRepository.getCurrentUser();
  }
}

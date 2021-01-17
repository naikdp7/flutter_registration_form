import 'package:registration_form/domain/model/user.dart';
import 'package:registration_form/domain/repository/user/user_repository.dart';
import 'package:registration_form/domain/usecase/baseusecase.dart';
import 'package:registration_form/domain/utils/resource.dart';

class GetUsersUseCase extends BaseUseCase {
  final UserRepository _userRepository;

  GetUsersUseCase(this._userRepository);

  @override
  Future<Resource<List<User>>> execute({params}) {
    return _userRepository.getAllUser();
  }
}

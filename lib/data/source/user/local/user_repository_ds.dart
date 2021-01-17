import 'package:registration_form/domain/model/user.dart';
import 'package:registration_form/domain/usecase/add_user_usecase.dart';
import 'package:registration_form/domain/usecase/update_default_user_usecase.dart';

abstract class UserRepoLocalDataSource {
  Future<List<User>> getAllUser();

  Future<bool> addUser(AddUserUseCaseParam param);

  Future<User> getCurrentUser();

  Future<bool> updateDefaultUser(UpdateDefaultUserUseCaseParam param);
}

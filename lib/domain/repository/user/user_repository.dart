import 'package:registration_form/domain/model/user.dart';
import 'package:registration_form/domain/usecase/add_user_usecase.dart';
import 'package:registration_form/domain/usecase/update_default_user_usecase.dart';
import 'package:registration_form/domain/utils/resource.dart';

import '../province/province_respository.dart';

abstract class UserRepository extends BaseRepository {
  Future<Resource<List<User>>> getAllUser();

  Future<Resource<bool>> addUser(AddUserUseCaseParam param);

  Future<Resource<User>> getCurrentUser();

  Future<Resource<bool>> updateDefaultUser(UpdateDefaultUserUseCaseParam param);
}

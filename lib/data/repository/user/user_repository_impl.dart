import 'package:registration_form/data/source/user/local/user_local_repository_ds.dart';
import 'package:registration_form/domain/model/user.dart';
import 'package:registration_form/domain/repository/user/user_repository.dart';
import 'package:registration_form/domain/usecase/add_user_usecase.dart';
import 'package:registration_form/domain/usecase/update_default_user_usecase.dart';
import 'package:registration_form/domain/utils/resource.dart';

import '../../../domain/utils/resource.dart';

class UserRepositoryImpl extends UserRepository {
  final UserLocalRepositoryDataSource _userLocalRepositoryDataSource;

  UserRepositoryImpl(this._userLocalRepositoryDataSource);

  @override
  Future<Resource<List<User>>> getAllUser() async {
    try {
      List<User> users = await _userLocalRepositoryDataSource.getAllUser();
      return Resource.success<List<User>>(data: users);
    } catch (e) {
      return Resource.error<List<User>>(
          error: "General Error", code: StatusCode.GENERAL_ERROR);
    }
  }

  @override
  Future<Resource<bool>> addUser(AddUserUseCaseParam param) async {
    try {
      bool isUserAdded = await _userLocalRepositoryDataSource.addUser(param);
      if (isUserAdded) {
        return Resource.success<bool>(
          data: isUserAdded,
        );
      } else {
        return Resource.error<bool>(
          code: parseError("USER_NOT_ADDED"),
        );
      }
    } catch (e) {
      return Resource.error<bool>(
          error: "General Error", code: StatusCode.GENERAL_ERROR);
    }
  }

  @override
  Future<Resource<User>> getCurrentUser() async {
    try {
      User user = await _userLocalRepositoryDataSource.getCurrentUser();
      return Resource.success<User>(data: user);
    } catch (e) {
      return Resource.error<User>(
          error: "General Error", code: StatusCode.GENERAL_ERROR);
    }
  }

  @override
  Future<Resource<bool>> updateDefaultUser(
      UpdateDefaultUserUseCaseParam param) async {
    try {
      bool isUserUpdated =
          await _userLocalRepositoryDataSource.updateDefaultUser(param);
      if (isUserUpdated) {
        return Resource.success<bool>(
          data: isUserUpdated,
        );
      } else {
        return Resource.error<bool>(
          code: parseError("USER_NOT_UPDATED"),
        );
      }
    } catch (e) {
      return Resource.error<bool>(
          error: "General Error", code: StatusCode.GENERAL_ERROR);
    }
  }
}

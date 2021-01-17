import 'package:registration_form/data/local/user_store.dart';
import 'package:registration_form/data/source/user/local/user_repository_ds.dart';
import 'package:registration_form/domain/model/user.dart';
import 'package:registration_form/domain/usecase/add_user_usecase.dart';
import 'package:registration_form/domain/usecase/update_default_user_usecase.dart';

class UserLocalRepositoryDataSource extends UserRepoLocalDataSource {
  final UserStore userStore;

  UserLocalRepositoryDataSource(this.userStore);

  @override
  Future<List<User>> getAllUser() async {
    return userStore.getAllUsers();
  }

  @override
  Future<bool> addUser(AddUserUseCaseParam param) async {
    return userStore.addUser(
      param.user.transform(),
    );
  }

  @override
  Future<bool> updateDefaultUser(UpdateDefaultUserUseCaseParam param) async {
    return userStore.updateDefaultUser(
      param.user.transform(),
    );
  }

  @override
  Future<User> getCurrentUser() {
    return userStore.getCurrentUser();
  }
}

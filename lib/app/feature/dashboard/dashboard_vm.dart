import 'package:registration_form/app/base/base_vm.dart';
import 'package:registration_form/domain/model/user.dart';
import 'package:registration_form/domain/usecase/get_users_usecase.dart';
import 'package:registration_form/domain/usecase/update_default_user_usecase.dart';
import 'package:rxdart/rxdart.dart';

class DashboardVM extends BaseVM {
  final GetUsersUseCase _getUsersUseCase;
  final UpdateDefaultUserUseCase _updateDefaultUserUseCase;
  PublishSubject<bool> defaultUserUpdateSubject = PublishSubject();

  DashboardVM(
    this._getUsersUseCase,
    this._updateDefaultUserUseCase,
  );

  @override
  void initState() {
    super.initState();
  }

  getAllUsers() {
    executeUseCaseOperation(
      baseUseCase: _getUsersUseCase,
      onSuccess: (data) {
        print(data);
      },
      onError: (error) {
        print(error);
      },
    );
  }

  updateDefaultUser(User user) {
    executeUseCaseOperation(
      baseUseCase: _updateDefaultUserUseCase,
      param: UpdateDefaultUserUseCaseParam(user),
      onSuccess: (data) {
        defaultUserUpdateSubject.add(true);
      },
      onError: (error) {
        defaultUserUpdateSubject.add(false);
        print(error);
      },
    );
  }

  @override
  void dispose() {
    defaultUserUpdateSubject.close();
    super.dispose();
  }
}

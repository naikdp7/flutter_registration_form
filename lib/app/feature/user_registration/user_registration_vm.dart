import 'package:flutter/cupertino.dart';
import 'package:registration_form/app/feature/user_registration/form_validator_error.dart';
import 'package:registration_form/app/helpers/regexhelper.dart';
import 'package:registration_form/domain/model/user.dart';
import 'package:registration_form/domain/usecase/add_user_usecase.dart';
import 'package:registration_form/app/base/base_vm.dart';
import 'package:rxdart/rxdart.dart';

class UserRegistrationVM extends BaseVM {
  final AddUserUseCase addUserUseCase;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  UserRegistrationVM(this.addUserUseCase);

  PublishSubject<FormValidatorError> formValidatorSubject = PublishSubject();
  PublishSubject<bool> userAddSubject = PublishSubject();

  @override
  void initState() {
    super.initState();
  }

  addUser(User user) {
    if (_isValidUserDetail(name: user.name, email: user.email)) {
      executeUseCaseOperation(
        baseUseCase: addUserUseCase,
        param: AddUserUseCaseParam(user),
        onError: (error) {},
        onSuccess: (data) {
          userAddSubject.add(true);
        },
      );
    }
  }

  bool _isValidUserDetail({String name, String email}) {
    if (email.isEmpty) {
      formValidatorSubject.add(FormValidatorError.emptyEmail);
      return false;
    }
    if (!RegexHelper.isValidEmail(email)) {
      formValidatorSubject.add(FormValidatorError.invalidEmail);
      return false;
    }
    if (name.isEmpty) {
      formValidatorSubject.add(FormValidatorError.emptyName);
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    formValidatorSubject.close();
    userAddSubject.close();
    super.dispose();
  }
}

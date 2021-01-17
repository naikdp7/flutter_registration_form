import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:registration_form/app/base/base_page.dart';
import 'package:registration_form/app/di/provider.dart';
import 'package:registration_form/app/feature/user_registration/form_validator_error.dart';
import 'package:registration_form/app/feature/user_registration/user_registration_mobile_view.dart';
import 'package:registration_form/app/navigation/route_paths.dart';
import 'package:registration_form/generated/l10n.dart';

import 'user_registration_vm.dart';

class UserRegistrationView extends BasePage<UserRegistrationVM> {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState
    extends BaseStatefulPage<UserRegistrationVM, UserRegistrationView> {
  @override
  void onModelReady(UserRegistrationVM model) {
    model.formValidatorSubject.listen((error) {
      switch (error) {
        case FormValidatorError.emptyName:
          showSnackBar(S.of(context).emptyNameError);
          break;
        case FormValidatorError.emptyEmail:
          showSnackBar(S.of(context).emptyEmailError);
          break;
        case FormValidatorError.invalidEmail:
          showSnackBar(S.of(context).inValidEmailError);
          break;
      }
    });

    model.userAddSubject.listen((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, RoutePaths.Dashboard);
      }
    });
  }

  @override
  Widget buildMobilePortrait(BuildContext context) {
    return UserRegistrationViewMobile();
  }

  @override
  UserRegistrationVM initViewModel() {
    ProviderContainer providerContainer = ProviderScope.containerOf(context);
    return providerContainer.read(userRegistrationVmProvider);
  }
}

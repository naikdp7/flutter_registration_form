import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:registration_form/app/base/base_page.dart';
import 'package:registration_form/app/base/base_vm.dart';
import 'package:registration_form/app/constants/app_colors.dart';
import 'package:registration_form/app/feature/user_registration/user_registration_vm.dart';
import 'package:registration_form/app/widgets/app_button.dart';
import 'package:registration_form/app/widgets/app_textfield.dart';
import 'package:registration_form/domain/model/user.dart';
import 'package:registration_form/generated/l10n.dart';

class UserRegistrationViewMobile
    extends BasePageViewWidget<UserRegistrationVM> {
  @override
  Widget build(BuildContext context, UserRegistrationVM model) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      S.of(context).signUp,
                      style: TextStyle(fontSize: 20),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                    top: 50,
                  ),
                  child: AppTextField(
                    controller: model.emailController,
                    labelText: S.of(context).email,
                    hintText: S.of(context).emailHint,
                    width: 312,
                    autofocus: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: AppTextField(
                    controller: model.nameController,
                    labelText: S.of(context).name,
                    hintText: S.of(context).nameHint,
                    width: 312,
                    autofocus: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 5,
                  ),
                  child: AppButton(
                    onPressed: (BaseVM buttonVM) async {
                      model.addUser(
                        User(
                          id: Random().nextInt(100),
                          email: model.emailController.text,
                          name: model.nameController.text,
                          isCurrentUser: 1,
                        ),
                      );
                    },
                    height: 44,
                    child: Center(
                      child: Text(
                        S.of(context).submit,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

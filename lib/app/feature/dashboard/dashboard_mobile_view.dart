import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:registration_form/app/base/base_page.dart';
import 'package:registration_form/app/base/base_vm.dart';
import 'package:registration_form/app/constants/app_colors.dart';
import 'package:registration_form/app/feature/dashboard/dashboard_vm.dart';
import 'package:registration_form/app/navigation/route_paths.dart';
import 'package:registration_form/app/widgets/app_button.dart';
import 'package:registration_form/generated/l10n.dart';

class DashboardMobileView extends BasePageViewWidget<DashboardVM> {
  @override
  Widget build(BuildContext context, DashboardVM model) {
    return SafeArea(
      child: Center(
        child: Container(
          margin: EdgeInsets.only(
            top: 20,
          ),
          child: AppButton(
            onPressed: (BaseVM buttonVM) {
              Navigator.pushNamed(context, RoutePaths.PersonalData);
            },
            height: 44,
            width: 312,
            child: Center(
              child: Text(
                S.of(context).completeProfile,
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
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:registration_form/app/base/base_page.dart';
import 'package:registration_form/app/constants/app_colors.dart';
import 'package:registration_form/app/di/provider.dart';
import 'package:registration_form/app/feature/dashboard/dashboard_mobile_view.dart';
import 'package:registration_form/app/navigation/route_paths.dart';
import 'package:registration_form/domain/model/user.dart';
import 'dashboard_vm.dart';

class DashboardView extends BasePage<DashboardVM> {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends BaseStatefulPage<DashboardVM, DashboardView> {
  @override
  void onModelReady(DashboardVM model) {
    model.getAllUsers();
    model.defaultUserUpdateSubject.listen((value) async {
      if (value) {
        // Navigator.pop(context);
        await Navigator.pushReplacementNamed(context, RoutePaths.Splash);
      }
    });
  }

  @override
  Widget buildMobilePortrait(BuildContext context) {
    return DashboardMobileView();
  }

  @override
  Widget drawer() {
    return Drawer(
      child: Consumer(
        builder: (context, watch, child) {
          Stream<List<User>> users = watch(usersProvider.stream);
          return StreamBuilder<List<User>>(
              stream: users,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    if (!snapshot.hasError) {
                      return ListView(
                          children: snapshot.data.map((user) {
                            return user.isCurrentUser == 1
                                ? DrawerHeader(
                              child: Column(
                                children: [
                                  Text(
                                    user.name,
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text("Add New User"),
                                  ),
                                  InkWell(
                                    child: Icon(
                                      Icons.add,
                                      color: AppColors.white,
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          RoutePaths.UserRegistration);
                                    },
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                              ),
                            )
                                : ListTile(
                              title: Text(user.name),
                              onTap: () {
                                getViewModel().updateDefaultUser(user);
                              },
                            );
                          }).toList());
                    }
                    return Center(
                      child: Text('Loading'),
                    );
                }
              });
        },
      ),
    );
  }

  @override
  DashboardVM initViewModel() {
    ProviderContainer providerContainer = ProviderScope.containerOf(context);
    return providerContainer.read(dashboardVmProvider);
  }
}

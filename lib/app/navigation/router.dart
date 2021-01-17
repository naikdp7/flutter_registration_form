import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registration_form/app/feature/addressdata/ktpaddressdata_view.dart';
import 'package:registration_form/app/feature/dashboard/dashboard_view.dart';
import 'package:registration_form/app/feature/personaldata/personaldata_view.dart';
import 'package:registration_form/app/feature/reviewdata/ktpaddressdata_view.dart';
import 'package:registration_form/app/feature/splash/splashview.dart';
import 'package:registration_form/app/feature/user_registration/user_registration_view.dart';
import 'package:registration_form/app/navigation/route_paths.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Splash:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
          settings: RouteSettings(name: RoutePaths.Splash),
        );

      case RoutePaths.PersonalData:
        return CupertinoPageRoute(
          builder: (context) => PersonalDataView(),
          settings: RouteSettings(name: RoutePaths.PersonalData),
        );

      case RoutePaths.AddressData:
        return CupertinoPageRoute(
          builder: (context) => KtpAddressDataView(settings.arguments),
          settings: RouteSettings(name: RoutePaths.AddressData),
        );

      case RoutePaths.ReviewData:
        return CupertinoPageRoute(
          builder: (context) => ReviewDataView(settings.arguments),
          settings: RouteSettings(name: RoutePaths.ReviewData),
        );

      case RoutePaths.UserRegistration:
        return CupertinoPageRoute(
          builder: (context) => UserRegistrationView(),
          settings: RouteSettings(name: RoutePaths.UserRegistration),
        );

      case RoutePaths.Dashboard:
        return CupertinoPageRoute(
          builder: (context) => DashboardView(),
          settings: RouteSettings(name: RoutePaths.Dashboard),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}

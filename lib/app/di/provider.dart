import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registration_form/app/feature/dashboard/dashboard_vm.dart';
import 'package:registration_form/app/feature/splash/splasvm.dart';
import 'package:registration_form/app/feature/user_registration/user_registration_vm.dart';
import 'package:registration_form/data/di/provider.dart';
import 'package:registration_form/data/local/user_store.dart';
import 'package:registration_form/domain/di/provider.dart';
import 'package:registration_form/domain/model/user.dart';

import '../feature/addressdata/ktpaddressdata_vm.dart';
import '../feature/addressdata/provincelist_vm.dart';

final provinceVmProvider = Provider.autoDispose<ProvinceListVM>(
  (ref) => ProvinceListVM(ref.read(fetchProvinceUseCaseProvider)),
);

final ktpAddressVmProvider = Provider.autoDispose<KtpAddressDataVM>(
  (ref) => KtpAddressDataVM(ref.read(provinceVmProvider)),
);

final userRegistrationVmProvider = Provider.autoDispose<UserRegistrationVM>(
  (ref) => UserRegistrationVM(ref.read(addUserUseCaseProvider)),
);

final dashboardVmProvider = Provider.autoDispose<DashboardVM>(
  (ref) => DashboardVM(
    ref.read(getUsersUseCaseProvider),
    ref.read(updateDefaultUseCaseProvider),
  ),
);

final splashVmProvider = Provider.autoDispose<SplashVM>(
  (ref) => SplashVM(),
);

final usersProvider = StreamProvider<List<User>>((ref) {
  UserStore userStore = ref.read(userStoreProvider);
  return userStore.usersStream;
});

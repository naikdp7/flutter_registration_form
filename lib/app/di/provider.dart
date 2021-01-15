import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registration_form/domain/di/provider.dart';

import '../feature/addressdata/ktpaddressdata_vm.dart';
import '../feature/addressdata/provincelist_vm.dart';

final provinceVmProvider = Provider<ProvinceListVM>(
  (ref) => ProvinceListVM(ref.read(fetchProvinceUseCaseProvider)),
);

final ktpAddressVmProvider = Provider<KtpAddressDataVM>(
  (ref) => KtpAddressDataVM(ref.read(provinceVmProvider)),
);

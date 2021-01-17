import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registration_form/data/di/provider.dart';
import 'package:registration_form/domain/usecase/add_user_usecase.dart';
import 'package:registration_form/domain/usecase/fetch_job_usecase.dart';
import 'package:registration_form/domain/usecase/get_current_user_usecase.dart';
import 'package:registration_form/domain/usecase/get_users_usecase.dart';
import 'package:registration_form/domain/usecase/update_default_user_usecase.dart';

import '../usecase/fetch_provinces.dart';

final fetchProvinceUseCaseProvider =
    Provider.autoDispose<FetchProvincesUseCase>(
  (ref) => FetchProvincesUseCase(
    ref.read(provinceRepositoryProvider),
  ),
);

final fetchJobUseCaseProvider = Provider.autoDispose<FetchJobUseCase>(
  (ref) => FetchJobUseCase(
    ref.read(jobRepositoryProvider),
  ),
);

final getUsersUseCaseProvider = Provider.autoDispose<GetUsersUseCase>(
  (ref) => GetUsersUseCase(
    ref.read(userRepositoryProvider),
  ),
);

final updateDefaultUseCaseProvider =
    Provider.autoDispose<UpdateDefaultUserUseCase>(
  (ref) => UpdateDefaultUserUseCase(
    ref.read(userRepositoryProvider),
  ),
);

final addUserUseCaseProvider = Provider.autoDispose<AddUserUseCase>(
  (ref) => AddUserUseCase(
    ref.read(userRepositoryProvider),
  ),
);

final getCurrentUseCaseProvider = Provider.autoDispose<GetCurrentUserUseCase>(
  (ref) => GetCurrentUserUseCase(
    ref.read(userRepositoryProvider),
  ),
);

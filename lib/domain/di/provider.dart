import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registration_form/data/di/provider.dart';
import 'package:registration_form/domain/usecase/fetch_job_usecase.dart';

import '../usecase/fetch_provinces.dart';

final fetchProvinceUseCaseProvider = Provider<FetchProvincesUseCase>(
  (ref) => FetchProvincesUseCase(ref.read(provinceRepositoryProvider)),
);

final fetchJobUseCaseProvider = Provider<FetchJobUseCase>(
  (ref) => FetchJobUseCase(ref.read(jobRepositoryProvider)),
);

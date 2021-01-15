import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registration_form/data/network/service/graphql/job_service.dart';
import 'package:registration_form/data/network/service/rest/api_service.dart';
import 'package:dio/dio.dart';
import 'package:registration_form/data/repository/job/job_repository_impl.dart';
import 'package:registration_form/data/repository/province/province_repository_impl.dart';
import 'package:registration_form/data/source/job/remote/job_remote_repository_ds.dart';
import 'package:registration_form/domain/repository/job/job_repository.dart';

import '../../domain/repository/province/province_respository.dart';
import '../source/province/remote/province_remote_repository_ds.dart';

final dioProvider = Provider<Dio>(
  (ref) => Dio(),
);

final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiService(ref.read(dioProvider)),
);

final jobServiceProvider = Provider<JobService>(
  (ref) => JobService(),
);

final provinceRemoteDataSourceProvider =
    Provider<ProvinceRemoteRepositoryDataSource>(
  (ref) => ProvinceRemoteRepositoryDataSource(ref.read(apiServiceProvider)),
);

final jobRemoteDataSourceProvider = Provider<JobRemoteRepositoryDataSource>(
  (ref) => JobRemoteRepositoryDataSource(ref.watch(jobServiceProvider)),
);

final provinceRepositoryProvider = Provider<ProvinceRepository>(
  (ref) => ProvinceRepositoryImpl(
    ref.read(provinceRemoteDataSourceProvider),
  ),
);

final jobRepositoryProvider = Provider<JobRepository>(
  (ref) => JobRepositoryImpl(
    ref.read(jobRemoteDataSourceProvider),
  ),
);

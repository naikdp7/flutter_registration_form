import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registration_form/data/local/dbhelper.dart';
import 'package:registration_form/data/local/user_store.dart';
import 'package:registration_form/data/network/service/graphql/job_service.dart';
import 'package:registration_form/data/network/service/rest/api_service.dart';
import 'package:dio/dio.dart';
import 'package:registration_form/data/repository/job/job_repository_impl.dart';
import 'package:registration_form/data/repository/province/province_repository_impl.dart';
import 'package:registration_form/data/repository/user/user_repository_impl.dart';
import 'package:registration_form/data/source/job/remote/job_remote_repository_ds.dart';
import 'package:registration_form/data/source/user/local/user_local_repository_ds.dart';
import 'package:registration_form/domain/repository/job/job_repository.dart';
import 'package:registration_form/domain/repository/user/user_repository.dart';

import '../../domain/repository/province/province_respository.dart';
import '../source/province/remote/province_remote_repository_ds.dart';

final dioProvider = Provider.autoDispose<Dio>(
  (ref) => Dio(),
);

final apiServiceProvider = Provider.autoDispose<ApiService>(
  (ref) => ApiService(ref.read(dioProvider)),
);

final jobServiceProvider = Provider.autoDispose<JobService>(
  (ref) => JobService(),
);

final provinceRemoteDataSourceProvider =
    Provider.autoDispose<ProvinceRemoteRepositoryDataSource>(
  (ref) => ProvinceRemoteRepositoryDataSource(ref.read(apiServiceProvider)),
);

final jobRemoteDataSourceProvider =
    Provider.autoDispose<JobRemoteRepositoryDataSource>(
  (ref) => JobRemoteRepositoryDataSource(ref.read(jobServiceProvider)),
);

final userLocalDataSourceProvider =
    Provider.autoDispose<UserLocalRepositoryDataSource>(
  (ref) => UserLocalRepositoryDataSource(
    ref.read(userStoreProvider),
  ),
);

final provinceRepositoryProvider = Provider.autoDispose<ProvinceRepository>(
  (ref) => ProvinceRepositoryImpl(
    ref.read(provinceRemoteDataSourceProvider),
  ),
);

final jobRepositoryProvider = Provider.autoDispose<JobRepository>(
  (ref) => JobRepositoryImpl(
    ref.read(jobRemoteDataSourceProvider),
  ),
);

final userRepositoryProvider = Provider.autoDispose<UserRepository>(
  (ref) => UserRepositoryImpl(
    ref.read(userLocalDataSourceProvider),
  ),
);

final dbHelperProvider = Provider.autoDispose<DbHelper>(
  (ref) => DbHelper.connect,
);

final userStoreProvider = Provider<UserStore>(
  (ref) => UserStore(
    ref.read(dbHelperProvider),
  ),
);

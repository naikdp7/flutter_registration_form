import 'package:registration_form/data/repository/error_mixin.dart';
import 'package:registration_form/domain/model/province.dart';
import 'package:registration_form/domain/utils/resource.dart';

abstract class ProvinceRepository extends BaseRepository {
  Future<Resource<List<Province>>> getProvinceList();
}

abstract class BaseRepository with ErrorMixin {}

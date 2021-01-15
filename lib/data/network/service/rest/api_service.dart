import 'package:dio/dio.dart';
import 'package:registration_form/data/network/service/rest/rest_endpoint.dart';
import 'package:retrofit/retrofit.dart';
import '../../response/province_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) {
    dio.options = BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET(GET_PROVINSI)
  Future<ProvinceResponse> getProvince();
}

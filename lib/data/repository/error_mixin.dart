import '../../domain/utils/resource.dart';

mixin ErrorMixin {
  int parseError(String errorCode) {
    switch (errorCode) {
      case "PROVINCE_NOT_FOUND":
        return CustomStatusCode.PROVINCE_NOT_FOUND;
      default:
        return StatusCode.GENERAL_ERROR;
    }
  }
}

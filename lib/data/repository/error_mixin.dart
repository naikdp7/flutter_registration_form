import '../../domain/utils/resource.dart';

mixin ErrorMixin {
  int parseError(String errorCode) {
    switch (errorCode) {
      case "PROVINCE_NOT_FOUND":
        return CustomStatusCode.PROVINCE_NOT_FOUND;
      case "USER_NOT_ADDED":
        return CustomStatusCode.USER_NOT_ADDED;
      case "USER_NOT_UPDATED":
        return CustomStatusCode.USER_NOT_UPDATED;
      default:
        return StatusCode.GENERAL_ERROR;
    }
  }
}

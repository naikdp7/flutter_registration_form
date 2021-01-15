import 'status.dart';

class Resource<T> {
  final T data;
  final CustomException exception;

  Resource({this.data, this.exception});

  static Resource<T> success<T>({T data}) {
    return Resource<T>(data: data);
  }

  static Resource<T> error<T>({T data, String error, int code}) {
    return Resource<T>(
      exception:
          CustomException(status: Status.ERROR, code: code, message: error),
    );
  }

  bool hasError() {
    return this.exception != null;
  }
}

class StatusCode {
  static const int NO_ERROR = 0;
  static const NETWORK_ERROR = 1;
  static const GENERAL_ERROR = 2;
}

class CustomStatusCode extends StatusCode {
  static const PROVINCE_NOT_FOUND = 4;
}

class CustomException {
  final Status status;
  final String message;
  final int code;

  CustomException({this.status, this.message, this.code});
}

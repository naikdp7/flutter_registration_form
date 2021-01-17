import '../utils/resource.dart';

abstract class BaseUseCase<BaseUseCaseParam> {
  Future<Resource<dynamic>> execute({BaseUseCaseParam params});
}

abstract class BaseUseCaseParam {}

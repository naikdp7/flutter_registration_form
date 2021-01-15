import '../utils/resource.dart';

abstract class BaseUseCase<BaseUseCaseParam> {
  Future<Resource<dynamic>> execute({BaseUseCaseParam params});
}

class BaseUseCaseParam {}

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/usecase/baseusecase.dart';
import '../../domain/utils/resource.dart';

class BaseVM extends ChangeNotifier {
  CompositeSubscription compositeDisposable = CompositeSubscription();
  StreamController<CustomException> _errorSubject =
      StreamController<CustomException>();

  StreamController<CustomException> get errorSubject => _errorSubject;

  bool _busy = false;

  bool get busy => _busy;

  BaseVM({busy = false}) {
    setBusy(busy);
    initState();
  }

  executeUseCaseOperation({
    @required BaseUseCase baseUseCase,
    BaseUseCaseParam param,
    Function(CustomException) onError,
    Function(dynamic) onSuccess,
  }) {
    setBusy(true);
    baseUseCase.execute(params: param).then((value) {
      if (value.hasError()) {
        setBusy(false);
        errorSubject.sink.add(value.exception);
        onError?.call(value.exception);
        setBusy(false);
      } else {
        setBusy(false);
        onSuccess.call(value.data);
      }
    });
  }

  @mustCallSuper
  void initState() {}

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  void onCleared() {
    compositeDisposable.dispose();
  }

  void addCompositeDisposable(StreamSubscription subscription) {
    if (compositeDisposable.isDisposed) {
      compositeDisposable = CompositeSubscription();
    }
    compositeDisposable.add(subscription);
  }

  @mustCallSuper
  void dispose() {
    onCleared();
    _errorSubject.close();
    super.dispose();
  }
}

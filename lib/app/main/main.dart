import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:registration_form/app/base/base_widget.dart';

import 'app.dart';
import 'app_vm.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runZoned(() {
    runApp(
      ProviderScope(
        child: MainApp(),
      ),
    );
  });
  // entry point for the app
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<AppVM>(
      viewModel: AppVM(),
      builder: (context, model, child) => App(),
    );
  }
}

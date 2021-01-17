import 'dart:async';

import 'package:floor/floor.dart';
import 'package:registration_form/data/local/app_db.dart';

class DbHelper {
  static final DbHelper connect = DbHelper._internal();

  DbHelper._internal();

  factory DbHelper() {
    return connect;
  }

  static AppDatabase _database;

  Future<AppDatabase> get db async {
    if (_database == null) {
      _database = await _initializeDatabase();
    }
    return _database;
  }

  Future<AppDatabase> _initializeDatabase() async {
    final callback = Callback(
      onCreate: (database, version) async {
        print("created");
        /* database has been created */
        print("Database Path: ${database.path}");
      },
      onOpen: (database) async {
        /* database has been opened */
      },
      onUpgrade: (database, startVersion, endVersion) {
        /* database has been upgraded */
      },
    );
    return await $FloorAppDatabase
        .databaseBuilder('appDb.db')
        .addCallback(callback)
        .build();
  }
}

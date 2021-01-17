import 'dart:async';

import 'package:floor/floor.dart';
import 'package:registration_form/data/local/dao/user_dao.dart';
import 'package:registration_form/data/local/entity/user_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_db.g.dart';

@Database(version: 1, entities: [UserEntity])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}
import 'dart:async';

import 'package:registration_form/data/local/app_db.dart';
import 'package:registration_form/data/local/dao/user_dao.dart';
import 'package:registration_form/data/local/dbhelper.dart';
import 'package:registration_form/data/local/entity/user_entity.dart';
import 'package:registration_form/domain/model/user.dart';

class UserStore {
  final DbHelper _dbHelper;
  UserDao _userDao;
  AppDatabase _appDatabase;
  StreamController<List<User>> _userController = StreamController<List<User>>();

  Stream<List<User>> get usersStream => _userController.stream;

  set userController(StreamController<List<User>> value) {
    _userController = value;
  }

  UserStore(this._dbHelper) {
    _init();
  }

  _init() async {
    _appDatabase = await _dbHelper.db;
    _userDao = _appDatabase.userDao;
  }

  Future<bool> addUser(UserEntity userEntity) async {
    return await _userDao.addUser(userEntity) > -1;
  }

  Future<bool> userIsLoggedIn() async {
    List<UserEntity> users = await _userDao.getAllUser();
    return users.isNotEmpty;
  }

  Future<User> getCurrentUser() async {
    if (_appDatabase == null) {
      _appDatabase = await _dbHelper.db;
      _userDao ??= _appDatabase.userDao;
    }
    UserEntity userEntity = await _userDao.getDefaultUser();
    if (userEntity == null) {
      return null;
    }
    return User(
      id: userEntity.id,
      name: userEntity.name,
      email: userEntity.email,
      isCurrentUser: userEntity.isCurrentUser,
    );
  }

  Future<List<User>> getAllUsers() async {
    List<UserEntity> userEntities = await _userDao.getAllUser();
    _userController.add(
      userEntities.map((e) => e.transform()).toList(),
    );
    return userEntities.map((e) => e.transform()).toList();
  }

  Future<bool> updateDefaultUser(UserEntity userEntity) async {
    return await _userDao.updateDefaultUser(userEntity) > -1;
  }
}

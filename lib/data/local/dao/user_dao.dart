import 'package:floor/floor.dart';
import 'package:registration_form/data/local/entity/user_entity.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User ORDER BY isCurrentUser DESC')
  Future<List<UserEntity>> getAllUser();

  @Query('SELECT * FROM User where isCurrentUser = 1')
  Future<UserEntity> getDefaultUser();

  @insert
  Future<int> insertUser(UserEntity user);

  @update
  Future<int> updateUser(UserEntity user);

  @transaction
  Future<int> addUser(UserEntity user) async {
    UserEntity userEntity = await getDefaultUser();
    if (userEntity != null) {
      userEntity.isCurrentUser = 0;
      await updateUser(userEntity);
    }
    return await insertUser(user);
  }

  @transaction
  Future<int> updateDefaultUser(UserEntity user) async {
    UserEntity userEntity = await getDefaultUser();
    if (userEntity != null) {
      userEntity.isCurrentUser = 0;
      user.isCurrentUser = 1;
      await updateUser(userEntity);
      int index = await updateUser(user);
      return index;
    }
    return -1;
  }
}

import 'package:registration_form/data/local/entity/user_entity.dart';
import 'package:registration_form/domain/utils/base_tranformer.dart';

class User extends BaseTransformer<User, UserEntity> {
  final int id;
  final String email;
  final String name;
  final int isCurrentUser;

  User({this.id, this.email, this.name, this.isCurrentUser});

  @override
  User restore(UserEntity userEntity) {
    return User(
        id: userEntity.id,
        email: userEntity.email,
        name: userEntity.name,
        isCurrentUser: userEntity.isCurrentUser);
  }

  @override
  UserEntity transform() {
    return UserEntity(
        id: id, email: email, name: name, isCurrentUser: isCurrentUser);
  }
}

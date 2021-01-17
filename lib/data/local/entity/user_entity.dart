import 'package:floor/floor.dart';
import 'package:registration_form/domain/model/user.dart';
import 'package:registration_form/domain/utils/base_tranformer.dart';

@Entity(tableName: "User")
class UserEntity extends BaseTransformer<UserEntity, User> {
  @primaryKey
  final int id;
  final String email;
  final String name;
  int isCurrentUser;

  UserEntity({this.id, this.email, this.name, this.isCurrentUser});

  @override
  UserEntity restore(User user) {
    return UserEntity(
      id: user.id,
      email: user.email,
      name: user.email,
      isCurrentUser: user.isCurrentUser,
    );
  }

  @override
  User transform() {
    return User(
      id: this.id,
      email: this.email,
      name: this.name,
      isCurrentUser: this.isCurrentUser,
    );
  }
}

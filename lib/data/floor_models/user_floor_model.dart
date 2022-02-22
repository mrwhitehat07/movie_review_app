import 'package:floor/floor.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM CelebsFloor')
  Future<List<UserFloor>> getAllUser();

  @Query('SELECT * FROM UserFloor WHERE id = :id')
  Stream<UserFloor?> getUserById(int id);

  @insert
  Future<void> insertUser(UserFloor user);

  @delete
  Future<void> deleteUser(UserFloor user);
}

@entity
class UserFloor {
  @primaryKey
  final int? id;
  final String? fname;
  final String? lname;
  final String? avatar;
  final int? phone;

  UserFloor({
    this.id,
    this.fname,
    this.lname,
    this.avatar,
    this.phone,
  });
}

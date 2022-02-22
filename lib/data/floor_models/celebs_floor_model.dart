import 'package:floor/floor.dart';

@dao
abstract class CelebsDao {
  @Query('SELECT * FROM CelebsFloor')
  Future<List<CelebsFloor>> getAllCelebs();

  @Query('SELECT * FROM CelebsFloor WHERE id = :id')
  Stream<CelebsFloor?> getCelebsById(int id);

  @insert
  Future<void> insertCelebs(CelebsFloor celebs);

  @delete
  Future<void> deleteCelebs(CelebsFloor celebs);
}

@entity
class CelebsFloor {
  @primaryKey
  final int? id;
  final String? fname;
  final String? lname;
  final String? image;
  final String? dob;
  final String? bio;
  final List<String>? role;
  
  CelebsFloor({
    this.id,
    this.fname,
    this.lname,
    this.image,
    this.dob,
    this.bio,
    this.role,
  });
}

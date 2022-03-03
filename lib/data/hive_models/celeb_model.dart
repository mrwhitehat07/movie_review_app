import 'package:hive/hive.dart';
part 'celeb_model.g.dart';

@HiveType(typeId: 1)
class CelebsModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String fname;
  @HiveField(2)
  final String lname;
  @HiveField(3)
  final String image;
  CelebsModel({
    required this.id,
    required this.fname,
    required this.lname,
    required this.image,
  });
}

import 'package:hive/hive.dart';
part 'search_model.g.dart';

@HiveType(typeId: 2)
class SearchModel extends HiveObject {
  @HiveField(0)
  final String query;
  SearchModel({
    required this.query,
  });
}
 
import "package:isar/isar.dart";
part "user.g.dart";

@collection
class User {
  Id id = Isar.autoIncrement;

  String? name;

  String? email;

  String? phone;

  String? passwd;

  List<int> favoriteTravelIds = [];
}

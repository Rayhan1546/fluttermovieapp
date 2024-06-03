import 'package:hive/hive.dart';

part 'movie.g.dart';

@HiveType(typeId: 0)
class Movie extends HiveObject {
  @HiveField(0)
  String? title;

  @HiveField(1)
  int? id;

  @HiveField(2)
  String? language;

  @HiveField(3)
  int? year;

  @HiveField(4)
  dynamic rating;

  @HiveField(5)
  String? largecoverimage;

  @HiveField(6)
  int? runtime;


  Movie(this.title, this.id, this.language, this.rating, this.largecoverimage, this.runtime, this.year);
}

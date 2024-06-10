import 'package:hive/hive.dart';

part 'hive_movie_model.g.dart';

@HiveType(typeId: 0)
class HiveMovieModel extends HiveObject {
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

  @HiveField(7)
  List<String>? genres;


  HiveMovieModel(this.title, this.id, this.language, this.rating, this.largecoverimage,
      this.runtime, this.year, this.genres);
}

import 'package:hive/hive.dart';
import 'package:mymovieapp/data/hive_database/hive_movie_model.dart';

class HiveDataSource {
  Future<bool> addMovies(List<HiveMovieModel> movies) async {
    try {
      final box = Hive.box<HiveMovieModel>('moviesBox');
      box.clear();
      box.addAll(movies);
      return true;
    } catch (e) {
      return false;
    }
  }

  List<HiveMovieModel> getMovies() {
    final box = Hive.box<HiveMovieModel>('moviesBox');
    return box.values.toList();
  }
}

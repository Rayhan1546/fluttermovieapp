import 'package:hive/hive.dart';
import 'package:mymovieapp/data/hive_database/movie.dart';

class HiveDataSource {
  Future<bool> addMovie(List<Movie> movies) async {
    try {
      final box = Hive.box<Movie>('moviesBox');
      box.addAll(movies);
      return true;
    } catch (e) {
      return false;
    }
  }

  List<Movie> getMovies() {
    final box = Hive.box<Movie>('moviesBox');
    return box.values.toList();
  }
}

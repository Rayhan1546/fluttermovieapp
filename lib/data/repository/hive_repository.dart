import 'package:mymovieapp/data/hive_database/movie.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';

abstract class HiveRepository {
  Future<bool> addToHive(List<Movie> movieList);
  List<Movie> getMovieFromHive();
  Future<bool> movieListFromApi(List<Movies>? movieList);
}

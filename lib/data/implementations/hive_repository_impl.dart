import 'package:mymovieapp/data/hive_database/hive_data_source.dart';
import 'package:mymovieapp/data/hive_database/movie.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/repository/hive_repository.dart';

class HiveRepositoryImpl extends HiveRepository {
  HiveDataSource hiveDataSource = HiveDataSource();

  @override
  Future<bool> addToHive(List<Movie> movieList) {
    return hiveDataSource.addMovie(movieList);
  }

  @override
  List<Movie> getMovieFromHive() {
    return hiveDataSource.getMovies();
  }

  @override
  Future<bool> movieListFromApi(List<Movies>? movieList) async {
    List<Movie> movies = [];
    for (var movie in movieList!) {
      movies.add(
        Movie(movie.title, movie.id, movie.language, movie.rating,
            movie.largeCoverImage, movie.runtime, movie.year),
      );
    }
    addToHive(movies);
    return true;
  }
}

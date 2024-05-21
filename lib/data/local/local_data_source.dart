import 'package:mymovieapp/data/models/movie_details_model.dart';

class LocalDataSource {
  List<Movie> favouriteMovie = [];

  Future<bool> addMovie(Movie movie) {
    try {
      if (!favouriteMovie.contains(movie)) {
        favouriteMovie.add(movie);
      }
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  Future<bool> removeMovie(Movie movie) {
    try {
      favouriteMovie.remove(movie);
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  Future<List<Movie>> getAllMovies() async {
    return favouriteMovie;
  }
}

import 'package:mymovieapp/data/models/movie_details_model.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';

abstract class FavouriteRepository {
  Future<bool> addToFavourite(Movie movie);
  Future<bool> removeFromFavourite(Movie movie);
  Future<List<Movie>> getFavouriteMovies();
}

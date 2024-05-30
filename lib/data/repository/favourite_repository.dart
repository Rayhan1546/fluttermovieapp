import 'package:mymovieapp/data/models/watch_list_movie_model.dart';

abstract class FavouriteRepository {
  Future<bool> addToFavourite(WatchListMovieModel movie);
  Future<bool> removeFromFavourite(WatchListMovieModel movie);
  Future<List<WatchListMovieModel>> getFavouriteMovies();
}

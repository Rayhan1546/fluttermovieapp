import 'package:mymovieapp/data/local/local_data_source.dart';
import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/data/repository/favourite_repository.dart';

class FavouriteRepositoryImpl extends FavouriteRepository {
  LocalDataSource localDataSource = LocalDataSource();

  @override
  Future<bool> addToFavourite(WatchListMovieModel movie) {
    return localDataSource.addMovie(movie);
  }

  @override
  Future<List<WatchListMovieModel>> getFavouriteMovies() {
    return localDataSource.getAllMovies();
  }

  @override
  Future<bool> removeFromFavourite(WatchListMovieModel movie) {
    return localDataSource.removeMovie(movie);
  }
}

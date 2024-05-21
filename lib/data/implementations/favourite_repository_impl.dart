import 'package:mymovieapp/data/local/local_data_source.dart';
import 'package:mymovieapp/data/models/movie_details_model.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/repository/favourite_repository.dart';

class FavouriteRepositoryImpl extends FavouriteRepository {
  LocalDataSource localDataSource = LocalDataSource();

  @override
  Future<bool> addToFavourite(Movie movie) {
    return localDataSource.addMovie(movie);
  }

  @override
  Future<List<Movie>> getFavouriteMovies() {
    return localDataSource.getAllMovies();
  }

  @override
  Future<bool> removeFromFavourite(Movie movie) {
    return localDataSource.removeMovie(movie);
  }
}

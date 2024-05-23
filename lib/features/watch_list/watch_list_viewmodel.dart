import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mymovieapp/data/implementations/favourite_repository_impl.dart';
import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/data/repository/favourite_repository.dart';

class WatchListViewmodel {
  FavouriteRepository favouriteRepository = FavouriteRepositoryImpl();

  ValueNotifier<List<WatchListMovieModel>> favouriteMovieList =
      ValueNotifier([]);
  ValueNotifier<bool> movieIndicator = ValueNotifier(false);

  Future getFavouriteMovies() async {
    List<WatchListMovieModel> movies =
        await favouriteRepository.getFavouriteMovies();
    favouriteMovieList.value = [];
    favouriteMovieList.value = movies;
    movieIndicator.value = true;
  }

  void onClickAddToFavourite(WatchListMovieModel movie) async {
    await favouriteRepository.addToFavourite(movie);
  }

  void onClickRemoveToFavourite(WatchListMovieModel movie) async {
    await favouriteRepository.removeFromFavourite(movie);
    getFavouriteMovies();
  }
}

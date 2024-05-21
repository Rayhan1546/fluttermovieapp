import 'package:flutter/cupertino.dart';
import 'package:mymovieapp/data/implementations/favourite_repository_impl.dart';
import 'package:mymovieapp/data/models/movie_details_model.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/repository/favourite_repository.dart';

class WatchListViewmodel {
  FavouriteRepository favouriteRepository = FavouriteRepositoryImpl();

  ValueNotifier<List<Movie>> favouriteMovieList = ValueNotifier([]);

  Future<void> getFavouriteMovies() async {
    List<Movie> movies = await favouriteRepository.getFavouriteMovies();
    favouriteMovieList.value = [];
    favouriteMovieList.value = movies;
  }

  void onClickAddToFavourite(Movie movie) async {
    await favouriteRepository.addToFavourite(movie);
  }

  void onClickRemoveToFavourite(Movie movie) async{
    await favouriteRepository.removeFromFavourite(movie);
    getFavouriteMovies();
  }
}

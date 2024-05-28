import 'package:flutter/cupertino.dart';
import 'package:mymovieapp/common/Instance/watch_list_viewmodel_instance.dart';
import 'package:mymovieapp/data/implementations/movie_repository_impl.dart';
import 'package:mymovieapp/data/models/movie_details_model.dart';
import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/data/repository/movie_repository.dart';
import 'package:mymovieapp/features/watch_list/watch_list_viewmodel.dart';

import 'movie_details_viewmodel.dart';

class MovieDetailsViewModel {
  static MovieDetailsViewModel? movieDetailsViewModel;

  static MovieDetailsViewModel getInstance() {
    movieDetailsViewModel ??= MovieDetailsViewModel();
    return movieDetailsViewModel!;
  }

  static ValueNotifier<Movie?> movieDetails = ValueNotifier(null);

  WatchListViewmodel watchListViewmodelInstance =
      WatchListViewmodelInstance.getInstance();

  MovieRepository movieRepository = MovieRepositoryImpl();

  Future getMovieDetails(int id) async {
    MovieDetailsModel movieDetailsModel =
        await movieRepository.getMovieDetails(id);
    movieDetails.value = movieDetailsModel.data?.movie;
  }

  void onClickAddFav(WatchListMovieModel movie) {
    watchListViewmodelInstance.onClickAddToFavourite(movie);
  }

}

import 'package:flutter/cupertino.dart';
import 'package:mymovieapp/common/Instance/watch_list_viewmodel_instance.dart';
import 'package:mymovieapp/data/implementations/movie_repository_impl.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/data/repository/movie_repository.dart';
import 'package:mymovieapp/features/watch_list/watch_list_viewmodel.dart';

class HomepageViewmodel {

  static ValueNotifier<List<Movies>?> movieList = ValueNotifier(null);

  MovieRepository movieRepository = MovieRepositoryImpl();

  WatchListViewmodel watchListViewmodel = WatchListViewmodelInstance.getInstance();

  Future getAllMovies() async {
    PopularMovieListModel popularMovieListModel = await movieRepository.getMovieList();
    movieList.value = popularMovieListModel.data?.movies;
  }

  void onClickAddToWatchLit(WatchListMovieModel movie){
    watchListViewmodel.onClickAddToFavourite(movie);
  }
}


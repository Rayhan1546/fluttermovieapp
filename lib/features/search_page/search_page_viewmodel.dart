import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymovieapp/common/Instance/watch_list_viewmodel_instance.dart';
import 'package:mymovieapp/data/implementations/movie_repository_impl.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/data/repository/movie_repository.dart';
import 'package:mymovieapp/features/home_page/homepage_viewmodel.dart';
import 'package:mymovieapp/features/search_page/widgets/debounce.dart';
import 'package:mymovieapp/features/watch_list/watch_list_viewmodel.dart';

class SearchPageViewmodel {
  ValueNotifier<List<Movies>?> get searchListMovies => HomepageViewmodel.movieList;

  final Debounce _debounce = Debounce(milliseconds: 500);
  TextEditingController searchController = TextEditingController();

  MovieRepository movieRepository = MovieRepositoryImpl();

  WatchListViewmodel watchListViewmodel = WatchListViewmodelInstance.getInstance();

  Future getMovieList(String text) async {
    PopularMovieListModel popularMovieListModel =
        await movieRepository.getSearchMovieList(text);
    searchListMovies.value = [];
    searchListMovies.value = popularMovieListModel.data?.movies;
  }

  void onClickAddToWatchList(WatchListMovieModel movie){
    watchListViewmodel.onClickAddToFavourite(movie);
  }

  void onSearchChanged(String queryTitile) {
    _debounce.run(() {
      getMovieList(queryTitile);
    });
  }
}

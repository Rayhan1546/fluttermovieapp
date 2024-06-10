import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymovieapp/data/hive_database/hive_data_source.dart';
import 'package:mymovieapp/data/implementations/movie_repository_impl.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/data/remote/api_client.dart';
import 'package:mymovieapp/data/repository/movie_repository.dart';
import 'package:mymovieapp/features/home_page/homepage_viewmodel.dart';
import 'package:mymovieapp/features/search_page/filter_page/filter_page_viewmodel.dart';
import 'package:mymovieapp/features/search_page/widgets/debounce.dart';
import 'package:mymovieapp/features/watch_list/watch_list_viewmodel.dart';

class SearchPageViewmodel {
  static SearchPageViewmodel? searchPageViewmodel;

  static SearchPageViewmodel getInstance() {
    searchPageViewmodel ??= SearchPageViewmodel(
      hiveDataSource: HiveDataSource(),
      apiClient: ApiClient(),
    );
    return searchPageViewmodel!;
  }

  SearchPageViewmodel({required hiveDataSource, required apiClient});

  HomepageViewmodel viewmodel = HomepageViewmodel.getInstance();

  FilterPageViewmodel filterPageViewmodel = FilterPageViewmodel.getInstance();

  ValueNotifier<List<Movies>?> get searchListMovies => viewmodel.movies;

  final Debounce _debounce = Debounce(milliseconds: 100);

  TextEditingController searchController = TextEditingController();

  WatchListViewmodel watchListViewmodel = WatchListViewmodel.getInstance();

  List<Movies> filterMoviesByGenres(List<Movies> movieList) {
    List<String> desiredGenres = filterPageViewmodel.selectedGenreString;

    List<Movies> filteredMovies = movieList.where((movie) {
      bool hasAllDesiredGenres = desiredGenres
          .every((desiredGenre) => movie.genres!.contains(desiredGenre));
      return hasAllDesiredGenres;
    }).toList();

    return filteredMovies;
  }

  Future getMovieList() async {
    PopularMovieListModel popularMovieListModel = await MovieRepositoryImpl(
            hiveDataSource: HiveDataSource(), apiClient: ApiClient())
        .getSearchMovieList(
            searchController.text,
            filterPageViewmodel.getSelectedSortBy(),
            filterPageViewmodel.getSelectedOrderBy());
    searchListMovies.value = [];
    searchListMovies.value = popularMovieListModel.data?.movies;
    if (filterPageViewmodel.selectedGenreString.isNotEmpty) {
      List<Movies> newMovieList = filterMoviesByGenres(searchListMovies.value!);
      searchListMovies.value = [];
      searchListMovies.value = newMovieList;
    }
  }

  void onClickAddToWatchList(WatchListMovieModel movie) {
    watchListViewmodel.onClickAddToFavourite(movie);
  }

  void onSearchChanged() {
    _debounce.run(() {
      getMovieList();
    });
  }
}

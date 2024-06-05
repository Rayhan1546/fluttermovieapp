import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mymovieapp/data/local/local_movie_source.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/features/watch_list/watch_list_viewmodel.dart';

class HomepageViewmodel {
  static HomepageViewmodel? homepageViewmodel;

  static HomepageViewmodel getInstance() {
    homepageViewmodel ??= HomepageViewmodel();
    return homepageViewmodel!;
  }

  static ValueNotifier<int> pageIndex = ValueNotifier(0);

  ValueNotifier<List<Movies>?> _movies = ValueNotifier(null);
  ValueNotifier<List<Movies>?> get movies => _movies;

  LocalMovieSource localMovieSource = LocalMovieSource.getInstance();

  HomepageViewmodel() {
    localMovieSource.fetchData();
    localMovieSource.movieStream.listen((movies) {
      _movies.value = movies;
    });
  }

  WatchListViewmodel watchListViewmodel = WatchListViewmodel.getInstance();

  void onClickAddToWatchLit(WatchListMovieModel movie) {
    watchListViewmodel.onClickAddToFavourite(movie);
  }

  void pageIndexChage(int newIndex) {
    pageIndex.value = newIndex;
  }
}

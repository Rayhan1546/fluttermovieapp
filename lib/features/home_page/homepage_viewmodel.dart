import 'package:flutter/foundation.dart';
import 'package:mymovieapp/data/hive_database/hive_data_source.dart';
import 'package:mymovieapp/data/implementations/movie_repository_impl.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/data/remote/api_client.dart';
import 'package:mymovieapp/data/repository/movie_repository.dart';
import 'package:mymovieapp/features/watch_list/watch_list_viewmodel.dart';

class HomepageViewmodel {
  static HomepageViewmodel? homepageViewmodel;

  static HomepageViewmodel getInstance() {
    homepageViewmodel ??= HomepageViewmodel(
        movieRepository: MovieRepositoryImpl(
      apiClient: ApiClient(),
      hiveDataSource: HiveDataSource(),
    ));
    return homepageViewmodel!;
  }

  MovieRepository movieRepository;

  late Stream<List<Movies>> _movieDataStream;

  static ValueNotifier<int> pageIndex = ValueNotifier(0);

  ValueNotifier<List<Movies>?> _movies = ValueNotifier(null);
  ValueNotifier<List<Movies>?> get movies => _movies;

  WatchListViewmodel watchListViewmodel = WatchListViewmodel.getInstance();

  HomepageViewmodel({required this.movieRepository}) {
    fetchMovieData();
  }

  void fetchMovieData() {
    debugPrint("Viewmodel: fetchMovieData");
    _movieDataStream = movieRepository.getMovieList(false);
    if (kDebugMode) {
      _movieDataStream.listen((movieList) {
        print(movieList);
        _movies.value = [];
        _movies.value = movieList;
      });
    }
  }

  void onClickAddToWatchLit(WatchListMovieModel movie) {
    watchListViewmodel.onClickAddToFavourite(movie);
  }

  void pageIndexChage(int newIndex) {
    pageIndex.value = newIndex;
  }
}

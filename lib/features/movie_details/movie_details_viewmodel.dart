import 'package:flutter/cupertino.dart';
import 'package:mymovieapp/data/hive_database/hive_data_source.dart';
import 'package:mymovieapp/data/implementations/movie_repository_impl.dart';
import 'package:mymovieapp/data/models/movie_details_model.dart';
import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/data/remote/api_client.dart';
import 'package:mymovieapp/data/repository/movie_repository.dart';
import 'package:mymovieapp/features/movie_details/widgets/torrent_handler.dart';
import 'package:mymovieapp/features/watch_list/watch_list_viewmodel.dart';

class MovieDetailsViewModel {
  static MovieDetailsViewModel? movieDetailsViewModel;

  MovieRepository movieRepository;

  ValueNotifier<Movie?> movieDetails = ValueNotifier(null);

  static MovieDetailsViewModel getInstance() {
    movieDetailsViewModel ??= MovieDetailsViewModel(
        movieRepository: MovieRepositoryImpl(
            apiClient: ApiClient(), hiveDataSource: HiveDataSource()));
    return movieDetailsViewModel!;
  }

  void init() {
    movieDetails.value = null;
  }

  MovieDetailsViewModel({required this.movieRepository});

  void getMovieDetails(int id) async {
    MovieDetailsModel? movieDetailsModel =
        await movieRepository.getMovieDetails(id);
    movieDetails.value = movieDetailsModel?.data?.movie;
  }

  WatchListViewmodel watchListViewmodelInstance =
      WatchListViewmodel.getInstance();

  void onClickAddFav(WatchListMovieModel movie) {
    watchListViewmodelInstance.onClickAddToFavourite(movie);
  }

  void onClickTorrentLaunch(String? url) {
    TorrentHandler torrentOpener = TorrentHandler(torrentUrl: url!);
    torrentOpener.openTorrent();
  }
}

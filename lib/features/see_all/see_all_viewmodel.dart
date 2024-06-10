import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/features/watch_list/watch_list_viewmodel.dart';

class SeeAllViewmodel {
  WatchListViewmodel watchListViewmodelInstance =
      WatchListViewmodel.getInstance();

  void onClickAddFav(WatchListMovieModel movie) {
    watchListViewmodelInstance.onClickAddToFavourite(movie);
  }
}

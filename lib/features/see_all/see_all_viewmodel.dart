import 'package:mymovieapp/common/Instance/watch_list_viewmodel_instance.dart';
import 'package:mymovieapp/data/models/movie_details_model.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/features/watch_list/watch_list_viewmodel.dart';

class SeeAllViewmodel {
  WatchListViewmodel watchListViewmodelInstance = WatchListViewmodelInstance.getInstance();

  void onClickAddFav(WatchListMovieModel movie){
    watchListViewmodelInstance.onClickAddToFavourite(movie);
  }
}
import 'package:flutter/cupertino.dart';
import 'package:mymovieapp/common/Instance/watch_list_viewmodel_instance.dart';
import 'package:mymovieapp/data/implementations/movie_details_repository_impl.dart';
import 'package:mymovieapp/data/models/movie_details_model.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/repository/movie_details_repository.dart';
import 'package:mymovieapp/features/home_page/homepage_viewmodel.dart';
import 'package:mymovieapp/features/watch_list/watch_list_viewmodel.dart';

class MovieDetailsViewModel {
  ValueNotifier<Movie?> movieDetails = ValueNotifier(null);

  WatchListViewmodel watchListViewmodelInstance = WatchListViewmodelInstance.getInstance();

  MovieDetailsRepository movieDetailsRepository = MovieDetailsRepositoryImpl();

  Future getMovieDetails(int id) async{
    MovieDetailsModel movieDetailsModel = await movieDetailsRepository.getMovieDetails(id);
    movieDetails.value = movieDetailsModel.data?.movie;
  }

  void onClickAddFav(Movie movie){
    watchListViewmodelInstance.onClickAddToFavourite(movie);
  }
}

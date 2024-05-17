import 'package:flutter/cupertino.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/repository/apicall_function.dart';
import 'package:mymovieapp/data/repository/cart_box_repo.dart';

class MovieDetailsViewModel{

  ValueNotifier<List<Movies>?> get popularMovies => ApiCallFunction.popularMovies;

  void onClickAdd(Movies movie){
     CartBoxRepo.addMovie(movie);
  }
}
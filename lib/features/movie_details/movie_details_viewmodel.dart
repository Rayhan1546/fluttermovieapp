import 'package:flutter/cupertino.dart';
import 'package:mymovieapp/data/models/movie_details_model.dart';
import 'package:mymovieapp/data/repository/apicall_function.dart';

class MovieDetailsViewModel{

  ValueNotifier<MovieDetailsModel?> movieDetails = ValueNotifier(null);

}
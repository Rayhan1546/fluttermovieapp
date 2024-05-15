import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:mymovieapp/models/popular_movie_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:mymovieapp/repository/apicall_function.dart';

class HomePageViewModel {
  void fetchData(){
    ApiCallFunction.fetchPopularMovies();
  }
}

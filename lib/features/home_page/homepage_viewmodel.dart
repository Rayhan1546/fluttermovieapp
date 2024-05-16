import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:mymovieapp/data/repository/apicall_function.dart';
import 'package:http/http.dart' as http;

class HomePageViewModel {
  void fetchData(){
    ApiCallFunction.fetchPopularMovies();
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';

import '../models/popular_movie_list_model.dart';
import 'package:http/http.dart' as http;

class ApiCallFunction {
  static ValueNotifier<List<Movie>?> popularMovies = ValueNotifier(null);

  static Future<void> fetchPopularMovies() async {
    final String apiUrl =
        'https://yts.mx/api/v2/list_movies.json?sort_by=topmovies&order_by=desc';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      PopularMovieListModel popularMovieListModel =
          PopularMovieListModel.fromJson(jsonDecode(response.body));
      popularMovies.value = popularMovieListModel.data?.movies;
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}

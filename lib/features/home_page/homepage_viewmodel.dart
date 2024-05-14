import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:mymovieapp/models/popularmovielist_model.dart';
import 'package:http/http.dart' as http;

class HomePageViewModel {
  ValueNotifier<List?> popularMovies = ValueNotifier(null);

  Future<void> fetchPopularMovies() async {
    final String apiUrl = 'https://yts.mx/api/v2/list_movies.json?sort_by=popularity&order_by=desc';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final popularMovieListModel = jsonDecode(response.body);
      List movies = popularMovieListModel['data']['movies'] as List;
      print(movies);
      popularMovies.value = movies;
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}

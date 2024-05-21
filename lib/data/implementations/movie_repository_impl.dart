import 'dart:convert';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/repository/movie_repository.dart';
import 'package:http/http.dart' as http;

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<PopularMovieListModel> getMovieList() async {
    final String movieUrl =
        'https://yts.mx/api/v2/list_movies.json?sort_by=topmovies&order_by=desc';
    final response = await http.get(Uri.parse(movieUrl));
    if (response.statusCode == 200) {
      final popularMovieListModel =
          PopularMovieListModel.fromJson(jsonDecode(response.body));
      return popularMovieListModel;
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}

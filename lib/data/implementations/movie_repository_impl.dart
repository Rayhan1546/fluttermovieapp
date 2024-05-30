import 'dart:convert';
import 'package:mymovieapp/data/models/movie_details_model.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/repository/movie_repository.dart';
import 'package:http/http.dart' as http;

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<PopularMovieListModel> getMovieList() async {
    const movieUrl =
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

  @override
  Future<PopularMovieListModel> getSearchMovieList(String text) async {
    String movieUrl = 'https://yts.mx/api/v2/list_movies.json?query_term=';
    movieUrl = movieUrl + text;
    final response = await http.get(Uri.parse(movieUrl));
    if (response.statusCode == 200) {
      final popularMovieListModel =
          PopularMovieListModel.fromJson(jsonDecode(response.body));
      return popularMovieListModel;
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int? id) async {
    String apiUrl = 'https://yts.mx/api/v2/movie_details.json?with_images=true&with_cast=true&movie_id=';
    apiUrl = '$apiUrl$id';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final movieDetailsModel =
          MovieDetailsModel.fromJson(jsonDecode(response.body));
      return movieDetailsModel;
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}

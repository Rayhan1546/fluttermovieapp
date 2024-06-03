import 'dart:convert';
import 'package:mymovieapp/data/models/movie_details_model.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/repository/movie_repository.dart';
import 'package:http/http.dart' as http;

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<PopularMovieListModel> getMovieList() async {
    final Uri movieUrl = Uri.https(
      'yts.mx',
      '/api/v2/list_movies.json',
      {
        'sort_by': 'topmovies',
        'order_by': 'desc',
        'limit': '50',
      },
    );
    final response = await http.get(movieUrl);
    if (response.statusCode == 200) {
      final popularMovieListModel =
          PopularMovieListModel.fromJson(jsonDecode(response.body));
      return popularMovieListModel;
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  @override
  Future<PopularMovieListModel> getSearchMovieList(
      String text, String sortBy, String orderBy) async {
    final Uri movieUrl = Uri.https(
      'yts.mx',
      '/api/v2/list_movies.json',
      {
        'query_term': text,
        'sort_by': sortBy,
        'order_by': orderBy,
      },
    );
    final response = await http.get(movieUrl);
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
    final Uri apiUrl = Uri.https('yts.mx', '/api/v2/movie_details.json', {
      'with_images': 'true',
      'with_cast': 'true',
      'movie_id': id.toString(),
    });

    final response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      final movieDetailsModel =
          MovieDetailsModel.fromJson(jsonDecode(response.body));
      return movieDetailsModel;
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}

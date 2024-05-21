import 'dart:convert';
import 'package:mymovieapp/data/models/movie_details_model.dart';
import 'package:mymovieapp/data/repository/movie_details_repository.dart';
import 'package:http/http.dart' as http;

class MovieDetailsRepositoryImpl extends MovieDetailsRepository {
  @override
  Future<MovieDetailsModel> getMovieDetails(int? id) async {
    String apiUrl = 'https://yts.mx/api/v2/movie_details.json?movie_id=';
    apiUrl = apiUrl + '$id';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final movieDetailsModel = MovieDetailsModel.fromJson(jsonDecode(response.body));
      return movieDetailsModel;
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}

import 'dart:convert';
import '../models/popularmovielist_model.dart';
import 'package:http/http.dart' as http;

class ApiCallFunction {
  static Future<PopularMovieListModel?> fetchMovieData() async {
    final response = await http.get(Uri.https(
        'https://yts.mx/api/v2/list_movies.json?sort_by=popular&order_by=desc&page=1'),);
    print(response.statusCode);
  }
}

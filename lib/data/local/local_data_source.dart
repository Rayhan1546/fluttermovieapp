import 'dart:convert';

import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  static const favouriteMovieSharedPrefKey = "favouriteMovies";
  List<WatchListMovieModel> favouriteMovieList = [];

  late SharedPreferences prefs;

  LocalDataSource() {
    init();
  }

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> addMovie(WatchListMovieModel movie) async {
    try {
      List<WatchListMovieModel> movies = await _getMoviesFromSharedPref();
      if (!movies.contains(movie)) {
        movies.add(movie);
        favouriteMovieList = [];
        await _saveMoviesToSharedPref(movies);
        favouriteMovieList = await _getMoviesFromSharedPref();
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<WatchListMovieModel>> getAllMovies() async {
    favouriteMovieList = await _getMoviesFromSharedPref();
    return Future.value(favouriteMovieList);
  }

  Future<bool> removeMovie(WatchListMovieModel movie) async {
    try {
      List<WatchListMovieModel> movies = await _getMoviesFromSharedPref();
      movies.remove(movie);
      await _saveMoviesToSharedPref(movies);
      favouriteMovieList = [];
      favouriteMovieList = await _getMoviesFromSharedPref();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<WatchListMovieModel>> _getMoviesFromSharedPref() async {
    List<WatchListMovieModel> movies = [];
    try {
      final encodedJsonString = prefs.getString(favouriteMovieSharedPrefKey);
      if (encodedJsonString != null) {
        movies = (json.decode(encodedJsonString) as List<dynamic>)
            .map<WatchListMovieModel>((e) => WatchListMovieModel.fromJson(e))
            .toList();
      }
      return movies;
    } catch (e) {
      return [];
    }
  }

  Future<void> _saveMoviesToSharedPref(List<WatchListMovieModel> movies) async {
    final encodedJson = json
        .encode(movies.map<Map<String, dynamic>>((e) => e.toJson()).toList());
    try {
      await prefs.setString(favouriteMovieSharedPrefKey, encodedJson);
    } catch (e) {
      // Handle error
    }
  }
}

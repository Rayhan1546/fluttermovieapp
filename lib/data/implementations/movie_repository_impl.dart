import 'dart:async';
import 'package:mymovieapp/data/hive_database/hive_data_source.dart';
import 'package:mymovieapp/data/hive_database/hive_movie_model.dart';
import 'package:mymovieapp/data/impl_helpers/api_call_timer.dart';
import 'package:mymovieapp/data/models/movie_details_model.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/remote/api_client.dart';
import 'package:mymovieapp/data/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  HiveDataSource hiveDataSource;
  ApiClient apiClient;

  MovieRepositoryImpl({required this.hiveDataSource, required this.apiClient});

  ApiCallTimer apiCallTimer = ApiCallTimer();

  @override
  Future<MovieDetailsModel?> getMovieDetails(int? id) async {
    try {
      MovieDetailsModel movieDetailsModel = await apiClient.getMovieDetails(id);
      return movieDetailsModel;
    } catch (e) {
      return null;
    }
  }

  @override
  Stream<List<Movies>> getMovieList(bool shouldFetchApi) async* {
    await Future.delayed(Duration(seconds: 3));

    if(!shouldFetchApi) {
      final moviesFromHive = await hiveDataSource.getMovies();
      List<Movies> movies = moviesFromHive
          .map((e) =>
          Movies(
              id: e.id,
              title: e.title,
              year: e.year,
              rating: e.rating,
              runtime: e.runtime,
              genres: e.genres,
              language: e.language,
              largeCoverImage: e.largecoverimage))
          .toList();

      yield movies;
    }

    PopularMovieListModel popularMovieListModel =
        await apiClient.getMovieList();
    final moviesFromApi = popularMovieListModel.data?.movies ?? [];

    await hiveDataSource.addMovies(moviesFromApi
        .map(
          (e) => HiveMovieModel(
            e.title,
            e.id,
            e.language,
            e.rating,
            e.largeCoverImage,
            e.runtime,
            e.year,
            (e.genres ?? []).cast<String>(),
          ),
        )
        .toList());

    yield moviesFromApi;
  }

  @override
  Future<PopularMovieListModel> getSearchMovieList(
      String text, String sortBy, String orderBy) async {
    PopularMovieListModel popularMovieListModel =
        await apiClient.getSearchMovieList(text, sortBy, orderBy);
    return popularMovieListModel;
  }
}

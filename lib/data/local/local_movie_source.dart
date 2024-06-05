import 'dart:async';
import 'package:mymovieapp/data/hive_database/hive_data_source.dart';
import 'package:mymovieapp/data/hive_database/movie.dart';
import 'package:mymovieapp/data/implementations/movie_repository_impl.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/repository/movie_repository.dart';

class LocalMovieSource {
  static LocalMovieSource? localMovieSource;

  static LocalMovieSource getInstance() {
    localMovieSource ??= LocalMovieSource();
    return localMovieSource!;
  }

  final StreamController<List<Movies>> _dataController =
      StreamController<List<Movies>>();

  Stream<List<Movies>> get movieStream => _dataController.stream;

  MovieRepository movieRepository = MovieRepositoryImpl();
  HiveDataSource hiveDataSource = HiveDataSource();

  Future<void> fetchData() async {
    try {
      PopularMovieListModel popularMovieListModel =
          await movieRepository.getMovieList();
      List<Movies> movies = popularMovieListModel.data?.movies ?? [];
      _dataController.add(movies);

      await hiveDataSource.addMovies(movies
          .map(
            (e) => Movie(
              e.title,
              e.id,
              e.language,
              e.rating,
              e.largeCoverImage,
              e.runtime,
              e.year,
              e.genres,
            ),
          )
          .toList());
    } catch (e) {
      List<Movie> moviesFromHive = hiveDataSource.getMovies();
      List<Movies> movies = moviesFromHive
          .map((e) => Movies(
              id: e.id,
              title: e.title,
              year: e.year,
              rating: e.rating,
              runtime: e.runtime,
              genres: e.genres,
              language: e.language,
              largeCoverImage: e.largecoverimage))
          .toList();
      _dataController.add(movies);
    }
  }
}

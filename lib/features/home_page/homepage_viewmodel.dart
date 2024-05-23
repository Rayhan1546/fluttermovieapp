import 'package:flutter/cupertino.dart';
import 'package:mymovieapp/data/implementations/movie_repository_impl.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/repository/movie_repository.dart';

class HomepageViewmodel {

  static ValueNotifier<List<Movies>?> movieList = ValueNotifier(null);

  MovieRepository movieRepository = MovieRepositoryImpl();

  Future getAllMovies() async {
    PopularMovieListModel popularMovieListModel = await movieRepository.getMovieList();
    movieList.value = popularMovieListModel.data?.movies;
  }
}


import 'package:mymovieapp/data/models/popular_movie_list_model.dart';

abstract class MovieRepository {
  Future<PopularMovieListModel> getMovieList();
}

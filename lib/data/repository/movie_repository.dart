import 'package:mymovieapp/data/models/movie_details_model.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';

abstract class MovieRepository {
  Stream<List<Movies>> getMovieList(
    bool shouldFetchApi,
  );
  Future<PopularMovieListModel> getSearchMovieList(
    String text,
    String sortBy,
    String orderBy,
  );
  Future<MovieDetailsModel?> getMovieDetails(
    int? id,
  );
}

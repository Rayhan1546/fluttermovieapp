import 'package:mymovieapp/data/models/movie_details_model.dart';

abstract class MovieDetailsRepository{
  Future<MovieDetailsModel> getMovieDetails(int? id);
}
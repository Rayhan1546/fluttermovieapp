import 'package:flutter/cupertino.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';

class CartBoxRepo {
  static final ValueNotifier<List<Movies>?> cartBoxMoviesList = ValueNotifier(null);

  static void addMovie(Movies movie) {
    if (cartBoxMoviesList.value == null) {
      cartBoxMoviesList.value = [movie];
    } else {
      final currentList = cartBoxMoviesList.value!;
      currentList.add(movie);
      cartBoxMoviesList.value = currentList;
    }
    print(cartBoxMoviesList.value);
  }
}

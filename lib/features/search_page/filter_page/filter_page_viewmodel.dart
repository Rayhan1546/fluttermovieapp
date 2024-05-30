import 'package:flutter/cupertino.dart';

class FilterPageViewmodel {
  static FilterPageViewmodel? filterPageViewmodel;

  static FilterPageViewmodel getInstance() {
    filterPageViewmodel ??= FilterPageViewmodel();
    return filterPageViewmodel!;
  }

  ValueNotifier<SortBy> sortBy = ValueNotifier(SortBy.none);

  void onChangedSortBy(SortBy sortBy) {
    this.sortBy.value = sortBy;
  }

  ValueNotifier<List<GenreFilterModel>> genreFilters = ValueNotifier(Genre
      .values
      .map((e) => GenreFilterModel(genre: e, isSelected: false))
      .toList());

  void onClickedGenreFilter(GenreFilterModel model, isSelected) {
    //GenreFilterModel? genreFilter = genreFilters.value.firstWhere((e) => e == model);
    model.isSelected = isSelected;
    genreFilters.value = [...genreFilters.value];
  }

  List<String> get selectedGenreString {
    return genreFilters.value
        .where((e) => e.isSelected)
        .map((e) => e.genre.name)
        .toList();
  }
}

enum SortBy { none, asc, desc }

class GenreFilterModel {
  Genre genre;
  bool isSelected;

  GenreFilterModel({
    required this.genre,
    required this.isSelected,
  });
}

enum Genre {
  none,
  action,
  animation,
  horror,
  crime,
  history,
  comedy,
  sciFi,
  fantasy,
  adventure,
  war;

  String getName() {
    switch (this) {
      case Genre.none:
        return "";
      case Genre.action:
        return "Action";
      default:
        return "Sci-FI";
    }
  }
}

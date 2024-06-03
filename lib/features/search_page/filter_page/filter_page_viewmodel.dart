import 'package:flutter/cupertino.dart';
import 'package:mymovieapp/features/search_page/filter_page/widgets/enums.dart';

class FilterPageViewmodel {
  static FilterPageViewmodel? filterPageViewmodel;

  static FilterPageViewmodel getInstance() {
    filterPageViewmodel ??= FilterPageViewmodel();
    return filterPageViewmodel!;
  }

  ValueNotifier<OrderBy> orderBy = ValueNotifier(OrderBy.desc);

  void onChangedSortedBy(OrderBy orderBy) {
    this.orderBy.value = orderBy;
  }

  ValueNotifier<SortBy> sortBy = ValueNotifier(SortBy.like_count);

  void onChangedSortBy(SortBy sortBy) {
    this.sortBy.value = sortBy;
  }

  ValueNotifier<List<GenreFilterModel>> genreFilters = ValueNotifier(Genre
      .values
      .map((e) => GenreFilterModel(genre: e, isSelected: false))
      .toList());

  void onClickedGenreFilter(GenreFilterModel model, isSelected) {
    model.isSelected = isSelected;
    genreFilters.value = [...genreFilters.value];
  }

  List<String> get selectedGenreString {
    return genreFilters.value
        .where((e) => e.isSelected)
        .map((e) => e.genre.name)
        .toList();
  }

  String getSelectedSortBy() {
    return sortBy.value.name;
  }

  String getSelectedOrderBy() {
    return orderBy.value.name;
  }
}

enum SortedBy { asc, desc }

enum SortBy { like_count, rating, download_count, year }

class GenreFilterModel {
  Genre genre;
  bool isSelected;

  GenreFilterModel({
    required this.genre,
    required this.isSelected,
  });
}

enum Genre {
  action,
  animation,
  horror,
  crime,
  history,
  comedy,
  SciFi,
  fantasy,
  adventure,
  war;
}

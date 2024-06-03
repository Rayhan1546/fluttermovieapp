enum OrderBy { asc, desc }

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
  Action,
  Animation,
  Horror,
  War,
  Crime,
  History,
  Comedy,
  Drama,
  Fantasy,
  Adventure;
}

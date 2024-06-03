class MovieModel {
  int? id;
  String? title;
  int? year;
  dynamic rating;
  int? runtime;
  String? language;
  String? largeCoverImage;

  MovieModel({
    this.id,
    this.title,
    this.year,
    this.rating,
    this.runtime,
    this.language,
    this.largeCoverImage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        year: json['year'],
        rating: json['rating'],
        runtime: json['runtime'],
        language: json['language'],
        largeCoverImage: json['largeCoverImage'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'year': year,
        'rating': rating,
        'runtime': runtime,
        'language': language,
        'largeCoverImage': largeCoverImage,
      };
}

import 'package:flutter/foundation.dart';

class WatchListMovieModel {
  final String name;
  final int id;
  final String image;
  final String releaseYear;
  final String runtime;
  final String rating;
  final List<dynamic> genres;

  WatchListMovieModel(
      {required this.name,
      required this.id,
      required this.image,
      required this.releaseYear,
      required this.runtime,
      required this.rating,
      required this.genres});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WatchListMovieModel &&
        other.name == name &&
        other.id == id &&
        other.image == image &&
        other.releaseYear == releaseYear &&
        other.runtime == runtime &&
        other.rating == rating &&
        listEquals(other.genres, genres);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        image.hashCode ^
        releaseYear.hashCode ^
        runtime.hashCode ^
        rating.hashCode ^
        genres.hashCode;
  }

  factory WatchListMovieModel.fromJson(Map<String, dynamic> json) {
    return WatchListMovieModel(
      name: json['name'],
      id: json['id'],
      image: json['image'],
      releaseYear: json['releaseYear'],
      runtime: json['runtime'],
      rating: json['rating'],
      genres: json['genres'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'image': image,
      'releaseYear': releaseYear,
      'runtime': runtime,
      'rating': rating,
      'genres': genres
    };
  }
}

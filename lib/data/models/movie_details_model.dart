class MovieDetailsModel {
  String? title;
  String? year;
  String? rated;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? writer;
  String? actors;
  String? plot;
  String? language;
  String? country;
  String? awards;
  String? poster;
  List<Ratings>? ratings;
  String? metascore;
  String? imdbRating;
  String? imdbVotes;
  String? imdbId;
  String? type;
  String? dvd;
  String? boxOffice;
  String? production;
  String? website;
  String? response;

  MovieDetailsModel(
      {this.title,
      this.year,
      this.rated,
      this.released,
      this.runtime,
      this.genre,
      this.director,
      this.writer,
      this.actors,
      this.plot,
      this.language,
      this.country,
      this.awards,
      this.poster,
      this.ratings,
      this.metascore,
      this.imdbRating,
      this.imdbVotes,
      this.imdbId,
      this.type,
      this.dvd,
      this.boxOffice,
      this.production,
      this.website,
      this.response});

  MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    title = json["Title"];
    year = json["Year"];
    rated = json["Rated"];
    released = json["Released"];
    runtime = json["Runtime"];
    genre = json["Genre"];
    director = json["Director"];
    writer = json["Writer"];
    actors = json["Actors"];
    plot = json["Plot"];
    language = json["Language"];
    country = json["Country"];
    awards = json["Awards"];
    poster = json["Poster"];
    ratings = json["Ratings"] == null
        ? null
        : (json["Ratings"] as List).map((e) => Ratings.fromJson(e)).toList();
    metascore = json["Metascore"];
    imdbRating = json["imdbRating"];
    imdbVotes = json["imdbVotes"];
    imdbId = json["imdbID"];
    type = json["Type"];
    dvd = json["DVD"];
    boxOffice = json["BoxOffice"];
    production = json["Production"];
    website = json["Website"];
    response = json["Response"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Title"] = title;
    _data["Year"] = year;
    _data["Rated"] = rated;
    _data["Released"] = released;
    _data["Runtime"] = runtime;
    _data["Genre"] = genre;
    _data["Director"] = director;
    _data["Writer"] = writer;
    _data["Actors"] = actors;
    _data["Plot"] = plot;
    _data["Language"] = language;
    _data["Country"] = country;
    _data["Awards"] = awards;
    _data["Poster"] = poster;
    if (ratings != null) {
      _data["Ratings"] = ratings?.map((e) => e.toJson()).toList();
    }
    _data["Metascore"] = metascore;
    _data["imdbRating"] = imdbRating;
    _data["imdbVotes"] = imdbVotes;
    _data["imdbID"] = imdbId;
    _data["Type"] = type;
    _data["DVD"] = dvd;
    _data["BoxOffice"] = boxOffice;
    _data["Production"] = production;
    _data["Website"] = website;
    _data["Response"] = response;
    return _data;
  }
}

class Ratings {
  String? source;
  String? value;

  Ratings({this.source, this.value});

  Ratings.fromJson(Map<String, dynamic> json) {
    source = json["Source"];
    value = json["Value"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Source"] = source;
    _data["Value"] = value;
    return _data;
  }
}

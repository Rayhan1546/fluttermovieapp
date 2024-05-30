class MovieDetailsModel {
  MovieDetailsModel({
    required this.status,
    required this.statusMessage,
    required this.data,
    required this.meta,
  });

  final String? status;
  final String? statusMessage;
  final Data? data;
  final Meta? meta;

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json){
    return MovieDetailsModel(
      status: json["status"],
      statusMessage: json["status_message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      meta: json["@meta"] == null ? null : Meta.fromJson(json["@meta"]),
    );
  }

}

class Data {
  Data({
    required this.movie,
  });

  final Movie? movie;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      movie: json["movie"] == null ? null : Movie.fromJson(json["movie"]),
    );
  }

}

class Movie {
  Movie({
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.titleEnglish,
    required this.titleLong,
    required this.slug,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.likeCount,
    required this.descriptionIntro,
    required this.descriptionFull,
    required this.ytTrailerCode,
    required this.language,
    required this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.cast,
    required this.torrents,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  final int? id;
  final String? url;
  final String? imdbCode;
  final String? title;
  final String? titleEnglish;
  final String? titleLong;
  final String? slug;
  final int? year;
  final dynamic rating;
  final int? runtime;
  final List<String> genres;
  final int? likeCount;
  final String? descriptionIntro;
  final String descriptionFull;
  final String? ytTrailerCode;
  final String? language;
  final String? mpaRating;
  final String? backgroundImage;
  final String? backgroundImageOriginal;
  final String? smallCoverImage;
  final String? mediumCoverImage;
  final String? largeCoverImage;
  final List<Cast> cast;
  final List<Torrent> torrents;
  final DateTime? dateUploaded;
  final int? dateUploadedUnix;

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      id: json["id"],
      url: json["url"],
      imdbCode: json["imdb_code"],
      title: json["title"],
      titleEnglish: json["title_english"],
      titleLong: json["title_long"],
      slug: json["slug"],
      year: json["year"],
      rating: json["rating"],
      runtime: json["runtime"],
      genres: json["genres"] == null ? [] : List<String>.from(json["genres"]!.map((x) => x)),
      likeCount: json["like_count"],
      descriptionIntro: json["description_intro"],
      descriptionFull: json["description_full"] ?? "",
      ytTrailerCode: json["yt_trailer_code"],
      language: json["language"],
      mpaRating: json["mpa_rating"],
      backgroundImage: json["background_image"],
      backgroundImageOriginal: json["background_image_original"],
      smallCoverImage: json["small_cover_image"],
      mediumCoverImage: json["medium_cover_image"],
      largeCoverImage: json["large_cover_image"],
      cast: json["cast"] == null ? [] : List<Cast>.from(json["cast"]!.map((x) => Cast.fromJson(x))),
      torrents: json["torrents"] == null ? [] : List<Torrent>.from(json["torrents"]!.map((x) => Torrent.fromJson(x))),
      dateUploaded: DateTime.tryParse(json["date_uploaded"] ?? ""),
      dateUploadedUnix: json["date_uploaded_unix"],
    );
  }

}

class Cast {
  Cast({
    required this.name,
    required this.characterName,
    required this.urlSmallImage,
    required this.imdbCode,
  });

  final String? name;
  final String? characterName;
  final String? urlSmallImage;
  final String? imdbCode;

  factory Cast.fromJson(Map<String, dynamic> json){
    return Cast(
      name: json["name"],
      characterName: json["character_name"],
      urlSmallImage: json["url_small_image"],
      imdbCode: json["imdb_code"],
    );
  }

}

class Torrent {
  Torrent({
    required this.url,
    required this.hash,
    required this.quality,
    required this.type,
    required this.isRepack,
    required this.videoCodec,
    required this.bitDepth,
    required this.audioChannels,
    required this.seeds,
    required this.peers,
    required this.size,
    required this.sizeBytes,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  final String? url;
  final String? hash;
  final String? quality;
  final String? type;
  final String? isRepack;
  final String? videoCodec;
  final String? bitDepth;
  final String? audioChannels;
  final int? seeds;
  final int? peers;
  final String? size;
  final int? sizeBytes;
  final DateTime? dateUploaded;
  final int? dateUploadedUnix;

  factory Torrent.fromJson(Map<String, dynamic> json){
    return Torrent(
      url: json["url"],
      hash: json["hash"],
      quality: json["quality"],
      type: json["type"],
      isRepack: json["is_repack"],
      videoCodec: json["video_codec"],
      bitDepth: json["bit_depth"],
      audioChannels: json["audio_channels"],
      seeds: json["seeds"],
      peers: json["peers"],
      size: json["size"],
      sizeBytes: json["size_bytes"],
      dateUploaded: DateTime.tryParse(json["date_uploaded"] ?? ""),
      dateUploadedUnix: json["date_uploaded_unix"],
    );
  }

}

class Meta {
  Meta({
    required this.serverTime,
    required this.serverTimezone,
    required this.apiVersion,
    required this.executionTime,
  });

  final int? serverTime;
  final String? serverTimezone;
  final int? apiVersion;
  final String? executionTime;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
      serverTime: json["server_time"],
      serverTimezone: json["server_timezone"],
      apiVersion: json["api_version"],
      executionTime: json["execution_time"],
    );
  }

}

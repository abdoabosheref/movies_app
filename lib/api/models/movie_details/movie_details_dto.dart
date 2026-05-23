import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/api/models/common/torrents_dto.dart';

import 'cast_dto.dart';

part 'movie_details_dto.g.dart';

@JsonSerializable()
class MovieDetailsDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "imdb_code")
  final String? imdbCode;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "title_english")
  final String? titleEnglish;
  @JsonKey(name: "title_long")
  final String? titleLong;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "year")
  final int? year;
  @JsonKey(name: "rating")
  final double? rating;
  @JsonKey(name: "runtime")
  final int? runtime;
  @JsonKey(name: "genres")
  final List<String>? genres;
  @JsonKey(name: "like_count")
  final int? likeCount;
  @JsonKey(name: "description_intro")
  final String? descriptionIntro;
  @JsonKey(name: "description_full")
  final String? descriptionFull;
  @JsonKey(name: "yt_trailer_code")
  final String? ytTrailerCode;
  @JsonKey(name: "language")
  final String? language;
  @JsonKey(name: "mpa_rating")
  final String? mpaRating;
  @JsonKey(name: "background_image")
  final String? backgroundImage;
  @JsonKey(name: "background_image_original")
  final String? backgroundImageOriginal;
  @JsonKey(name: "small_cover_image")
  final String? smallCoverImage;
  @JsonKey(name: "medium_cover_image")
  final String? mediumCoverImage;
  @JsonKey(name: "large_cover_image")
  final String? largeCoverImage;
  @JsonKey(name: "medium_screenshot_image1")
  final String? mediumScreenshotImage1;
  @JsonKey(name: "medium_screenshot_image2")
  final String? mediumScreenshotImage2;
  @JsonKey(name: "medium_screenshot_image3")
  final String? mediumScreenshotImage3;
  @JsonKey(name: "large_screenshot_image1")
  final String? largeScreenshotImage1;
  @JsonKey(name: "large_screenshot_image2")
  final String? largeScreenshotImage2;
  @JsonKey(name: "large_screenshot_image3")
  final String? largeScreenshotImage3;
  @JsonKey(name: "cast")
  final List<CastDto>? cast;
  @JsonKey(name: "torrents")
  final List<TorrentsDto>? torrents;
  @JsonKey(name: "date_uploaded")
  final String? dateUploaded;
  @JsonKey(name: "date_uploaded_unix")
  final int? dateUploadedUnix;

  MovieDetailsDto({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.likeCount,
    this.descriptionIntro,
    this.descriptionFull,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.mediumScreenshotImage1,
    this.mediumScreenshotImage2,
    this.mediumScreenshotImage3,
    this.largeScreenshotImage1,
    this.largeScreenshotImage2,
    this.largeScreenshotImage3,
    this.cast,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  factory MovieDetailsDto.fromJson(Map<String, dynamic> json) {
    return _$MovieDetailsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MovieDetailsDtoToJson(this);
  }
}

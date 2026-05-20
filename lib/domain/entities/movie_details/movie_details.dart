import 'package:movies_app/domain/entities/movie_details/cast.dart';

class MovieDetails {
  final int? id;
  final String? url;
  final String? title;

  final int? year;
  final double? rating;

  final List<String>? genres;
  final int? likeCount;
  final int? runtime;
  final String? descriptionIntro;
  final String? backgroundImage;
  final String? mediumCoverImage;
  final String? mediumScreenshotImage1;
  final String? mediumScreenshotImage2;
  final String? mediumScreenshotImage3;
  final List<Cast>? cast;

  MovieDetails({
    this.id,
    this.url,
    this.title,

    this.year,
    this.rating,
    this.genres,
    this.likeCount,
    this.descriptionIntro,
    this.backgroundImage,
    this.mediumCoverImage,
    this.mediumScreenshotImage1,
    this.mediumScreenshotImage2,
    this.mediumScreenshotImage3,
    this.cast,
    this.runtime,
  });
}

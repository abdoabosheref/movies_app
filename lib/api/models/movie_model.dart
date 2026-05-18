class Movie {
  final String title;
  final String year;
  final String rating;
  final String duration;
  final String likes;
  final String summary;
  final String image;
  final List<String> screenShots;
  final List<Cast> cast;
  final List<String> genres;

  Movie({
    required this.title,
    required this.year,
    required this.rating,
    required this.duration,
    required this.likes,
    required this.summary,
    required this.image,
    required this.screenShots,
    required this.cast,
    required this.genres,
  });
}

class Cast {
  final String name;
  final String character;
  final String image;

  Cast({
    required this.name,
    required this.character,
    required this.image,
  });
}

class FirebaseMovieModel {
  final String movieId;
  final String mediumCoverImage;
  final double rating;

  FirebaseMovieModel({
    required this.movieId,
    required this.mediumCoverImage,
    required this.rating,
  });

  FirebaseMovieModel.fromFirestore(Map<String, dynamic> data)
      : movieId = data['movieId'] ?? '',
        mediumCoverImage = data['mediumCoverImage'] ?? '',
        rating = (data['rating'] as num?)?.toDouble() ?? 0.0;

  Map<String, dynamic> toFirestore() {
    return {
      'movieId': movieId,
      'mediumCoverImage': mediumCoverImage,
      'rating': rating,
    };
  }
}
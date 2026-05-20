import 'dart:math';

abstract class MoviesGenre {
  static const List<String> moviesGenreList = [
    'Action',
    'Adventure',
    'Animation',
    'Biography',
    'Comedy',
    'Crime',
    'Documentary',
    'Drama',
    'Family',
    'Fantasy',
    'Film-Noir',
    'Game-Show',
    'History',
    'Horror',
    'Music',
    'Musical',
    'Mystery',
    'News',
    'Reality-TV',
    'Romance',
    'Sci-Fi',
    'Short',
    'Sport',
    'Talk-Show',
    'Thriller',
    'War',
    'Western',
  ];

  static String shuffleGenre() {
    final randomGenre = Random();
    return moviesGenreList[randomGenre.nextInt(moviesGenreList.length)];
  }
}
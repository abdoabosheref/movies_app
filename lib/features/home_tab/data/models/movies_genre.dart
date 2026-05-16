import 'dart:math';

abstract class MoviesGenre {
  static const String action = 'Action';
  static const String adult = 'Adult';
  static const String adventure = 'Adventure';
  static const String animation = 'Animation';
  static const String biography = 'Biography';
  static const String comedy = 'Comedy';
  static const String crime = 'Crime';
  static const String documentary = 'Documentary';
  static const String drama = 'Drama';
  static const String family = 'Family';
  static const String fantasy = 'Fantasy';
  static const String filmNoir = 'Film-Noir';
  static const String gameShow = 'Game-Show';
  static const String history = 'History';
  static const String horror = 'Horror';
  static const String musical = 'Musical';
  static const String music = 'Music';
  static const String mystery = 'Mystery';
  static const String news = 'News';
  static const String realityTv = 'Reality-TV';
  static const String romance = 'Romance';
  static const String sciFi = 'Sci-Fi';
  static const String short = 'Short';
  static const String sport = 'Sport';
  static const String talkShow = 'Talk-Show';
  static const String thriller = 'Thriller';
  static const String war = 'War';
  static const String western = 'Western';

  static const List<String> moviesGenreList = [
    action,
    adult,
    adventure,
    animation,
    biography,
    comedy,
    crime,
    documentary,
    drama,
    family,
    fantasy,
    filmNoir,
    gameShow,
    history,
    horror,
    musical,
    music,
    mystery,
    news,
    realityTv,
    romance,
    sciFi,
    short,
    sport,
    talkShow,
    thriller,
    war,
    western,
  ];

  static String shuffleGenre() {
    final randomGenre = Random();
    return moviesGenreList[randomGenre.nextInt(moviesGenreList.length)];
  }
}

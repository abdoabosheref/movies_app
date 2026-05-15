import 'package:flutter/material.dart';
import 'package:movies_app/features/home_tab/data/models/movies_genre.dart';
import 'package:movies_app/features/home_tab/data/models/movies_list_response.dart';

sealed class HomeTabState {}
 class InitState extends HomeTabState{}

class HomeLoadingState extends HomeTabState{}

class HomeSuccessState extends HomeTabState{
  String genreShuffle = MoviesGenre.shuffleGenre();
  List<Movies> movies ;
  List<Movies> moviesByGenre ;
  HomeSuccessState({required this.movies,
    required this.moviesByGenre, required this.genreShuffle});
}
class HomeErrorState extends HomeTabState{
  String errorMessage;
  HomeErrorState({required this.errorMessage});
}

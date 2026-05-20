import 'package:movies_app/core/exceptions/app_exceptions.dart';

sealed class SearchTabStates {}

class SearchTabInitialState extends SearchTabStates {}

class SearchTabLoadingState extends SearchTabStates {}

class SearchTabSuccessState extends SearchTabStates {
}
class SearchTabChangeSelectedIndexState extends SearchTabStates {}

class SearchTabErrorState extends SearchTabStates {
  AppException appException;

  SearchTabErrorState({required this.appException});
}

import 'package:movies_app/core/exceptions/app_exceptions.dart';

sealed class BrowseTabStates {}

class BrowseTabInitialState extends BrowseTabStates {}

class BrowseTabLoadingState extends BrowseTabStates {}

class BrowseTabSuccessState extends BrowseTabStates {
}
class BrowseTabChangeSelectedIndexState extends BrowseTabStates {}

class BrowseTabErrorState extends BrowseTabStates {
  AppException appException;

  BrowseTabErrorState({required this.appException});
}

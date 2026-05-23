import 'package:movies_app/core/exceptions/app_exceptions.dart';

sealed class HistoryStates {}

class HistoryInitialState extends HistoryStates {}

class HistoryLoadingState extends HistoryStates {}
class HistorySuccessState extends HistoryStates {}
class HistoryErrorState extends HistoryStates {
  AppException appException;

  HistoryErrorState({required this.appException});
}

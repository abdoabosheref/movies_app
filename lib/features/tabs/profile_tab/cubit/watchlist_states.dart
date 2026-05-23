
abstract class WatchlistStates {
  const WatchlistStates();
}

class WatchlistInitialState extends WatchlistStates {}
class WatchlistLoadingState extends WatchlistStates {}
class WatchlistSuccessState extends WatchlistStates {}
class WatchlistErrorState extends WatchlistStates {
  final String error;
  const WatchlistErrorState(this.error);
}


class WatchlistSavedStatusState extends WatchlistStates {
  final bool isSaved;
  const WatchlistSavedStatusState(this.isSaved);
}
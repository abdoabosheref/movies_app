import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart'; // سطر جديد
import '../../../screens/movie_details/firebase/watchlist_firebase_service.dart';
import 'watchlist_states.dart';

@injectable
class WatchlistViewModel extends Cubit<WatchlistStates> {
  final WatchlistFirebaseService _firebaseService;

  WatchlistViewModel(this._firebaseService) : super(WatchlistInitialState());



  Future<void> checkMovieWatchlistStatus(int movieId) async {
    try {
      bool isExist = await _firebaseService.isMovieInWatchlist(movieId);
      emit(WatchlistSavedStatusState(isExist));
    } catch (e) {
      emit(WatchlistErrorState(e.toString()));
    }
  }

  // 2. دالة التبديل (تلوين وحذف أو إضافة فورية)
  Future<void> toggleMovieWatchlist({
    required int movieId,
    required String title,
    required String imageUrl,
    required double rating,
    required bool isCurrentlySaved,
  }) async {
    try {
      if (isCurrentlySaved) {
        emit(const WatchlistSavedStatusState(false)); // اقلب أبيض
        await _firebaseService.removeFromWatchlist(movieId); // احذف من الفايربيس
        emit(const WatchlistSavedStatusState(false)); //  أكد الحالة عشان الـ UI يثبت عليها!
      } else {
        emit(const WatchlistSavedStatusState(true)); // اقلب أحمر
        await _firebaseService.addToWatchlist(
          movieId: movieId,
          title: title,
          imageUrl: imageUrl,
          rating: rating,
        );
        emit(const WatchlistSavedStatusState(true)); // أكد الحالة عشان الـ UI يثبت عليها!
      }
    } catch (e) {
      emit(WatchlistSavedStatusState(isCurrentlySaved));
      emit(WatchlistErrorState(e.toString()));
    }
  }




  Future<void> addMovieToWatchlist({
    required int movieId,
    required String title,
    required String imageUrl,
    required double rating,
  }) async {
    emit(WatchlistLoadingState());
    try {
      await _firebaseService.addToWatchlist(
        movieId: movieId,
        title: title,
        imageUrl: imageUrl,
        rating: rating,
      );
      emit(WatchlistSuccessState());
    } catch (e) {
      emit(WatchlistErrorState(e.toString()));
    }
  }


  Stream<int> getWatchlistCount() {
    return _firebaseService.getWatchlist().map((snapshot) => snapshot.docs.length);
  }

}



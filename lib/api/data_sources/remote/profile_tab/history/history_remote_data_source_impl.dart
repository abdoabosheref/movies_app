import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/mappers/profile_tab/firebase_movie_model_mapper.dart';
import 'package:movies_app/api/mappers/profile_tab/to_movie_mapper.dart';
import 'package:movies_app/api/models/firebase_auth/user_model.dart';
import 'package:movies_app/data/data_sources/remote/profile_tab/history/history_remote_data_source.dart';
import 'package:movies_app/domain/entities/movie_response/movie.dart';

@Injectable(as: HistoryRemoteDataSource)
class HistoryRemoteDataSourceImpl implements HistoryRemoteDataSource {
  @override
  Future<void> addMovieToHistory({required Movie movie}) async {
    String? uId = FirebaseAuth.instance.currentUser?.uid;
    print("User UID is: $uId");
    if (uId == null) throw Exception("User not logged in");
    await UserModel.historyCollection(
      uId,
    ).doc('${movie.id}').set(movie.toFirebaseMovieModel());
  }


  @override
  Future<List<Movie>> getMovieHistory() async {
    String? uId = FirebaseAuth.instance.currentUser?.uid;
    if (uId == null) throw Exception("User not logged in");

    final firebaseMoviesQuerySnapshot = await UserModel.historyCollection(uId)
        .get();

    return firebaseMoviesQuerySnapshot.docs.map((doc) => doc.data().toMovie()).toList();
  }
}

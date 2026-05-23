import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/models/firebase_auth/user_model.dart';
@lazySingleton
class WatchlistFirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get _userId => _auth.currentUser?.uid ?? 'guest_user';

  Future<void> addToWatchlist({
    required int movieId,
    required String title,
    required String imageUrl,
    required double rating,
  }) async {
    await _firestore
        .collection(UserModel.collectionName)
        .doc(_userId)
        .collection('watchlist')
        .doc(movieId.toString())
        .set({
          'id': movieId,
          'title': title,
          'imageUrl': imageUrl,
          'rating': rating,
          'addedAt': FieldValue.serverTimestamp(),
        });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getWatchlist() {
    return _firestore
        .collection(UserModel.collectionName)
        .doc(_userId)
        .collection('watchlist')
        .orderBy('addedAt', descending: true)
        .snapshots();
  }

  Future<void> removeFromWatchlist(int movieId) async {
    await _firestore
        .collection(UserModel.collectionName)
        .doc(_userId)
        .collection('watchlist')
        .doc(movieId.toString())
        .delete();
  }

  Future<bool> isMovieInWatchlist(int movieId) async {
    var doc = await _firestore
        .collection(UserModel.collectionName)
        .doc(_userId)
        .collection('watchlist')
        .doc(movieId.toString())
        .get();

    return doc.exists;
  }
}

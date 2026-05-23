import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/api/models/profile_tab/firebase_movie_model.dart';

class UserModel {
  static const String collectionName = "user";

  final String uId;
  final String name;
  final String email;
  final String phone;
  final int avatarIndex;

  UserModel({
    required this.uId,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarIndex,
  });

  static CollectionReference<UserModel> collection() {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) =>
              UserModel.fromFireStore(snapshot.data()!),
          toFirestore: (user, _) => user.toFireStore(),
        );
  }

  static CollectionReference<FirebaseMovieModel>historyCollection(String uId) {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .doc(uId)
        .collection('history')
        .withConverter(
          fromFirestore: (snapshot, options) =>
              FirebaseMovieModel.fromFirestore(snapshot.data()!),
          toFirestore: (movie, options) => movie.toFirestore(),
        );
  }

  UserModel copyWith({
    String? uId,
    String? name,
    String? phone,
    int? avatarIndex,
  }) {
    return UserModel(
      uId: uId ?? this.uId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      avatarIndex: avatarIndex ?? this.avatarIndex,
      email: email,
    );
  }

  UserModel.fromFireStore(Map<String, dynamic> data)
    : this(
        uId: data['uId'],
        name: data['name'],
        email: data['email'],
        phone: data['phone'],
        avatarIndex: data['avatarIndex'],
      );

  Map<String, dynamic> toFireStore() {
    return {
      'uId': uId,
      'name': name,
      'email': email,
      'phone': phone,
      'avatarIndex': avatarIndex,
    };
  }
}

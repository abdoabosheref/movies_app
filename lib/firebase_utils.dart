import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/features/auth/data/models/user_model.dart';

class FirebaseUtils {


  Future<void> saveUserToFireStore(UserModel user) async {
    await FirebaseFirestore.instance
        .collection(user.collectionName)
        .doc(user.id)
        .set(user.toFireStore());
  }


}

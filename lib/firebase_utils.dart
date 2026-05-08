import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/mvvm/models/my_user.dart';

class FirebaseUtils {


  Future<void> saveUserToFireStore(MyUser user) async {
    await FirebaseFirestore.instance
        .collection(user.collectionName)
        .doc(user.id)
        .set(user.toFireStore());
  }


}

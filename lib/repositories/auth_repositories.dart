import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hamropasal/services/service_management.dart';

import '../Model/user_model.dart';

class AuthRepository {
  CollectionReference<UserModel> userRef =
      FirebaseService.db.collection("users").withConverter(
          fromFirestore: (snapshot, _) {
            return UserModel.fromFirebaseSnapshot(snapshot);
          },
          toFirestore: (model, _) => model.toJson());

  Future<UserCredential?> register(UserModel user) async {
    try {
      final response =
          await userRef.where("email", isEqualTo: user.email!).get();
      if (response.size != 0) throw Exception("User email already exit");
      UserCredential _uc = await FirebaseService.firebaseAuth
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);
      user.id = _uc.user!.uid;

      await FirebaseService.db.collection("users").add(user.toJson());
      return _uc;
    } catch (err) {
      rethrow;
    }
  }
}

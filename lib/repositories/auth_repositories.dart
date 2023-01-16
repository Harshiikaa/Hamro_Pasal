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
          await userRef.where("email", isEqualTo: user.fullname!).get();
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

  Future<UserCredential> login(String email, String password) async {
    try {
      UserCredential _uc = await FirebaseService.firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return _uc;
    } catch (err) {
      rethrow;
    }
  }

  Future<UserModel> getUserDetail(String id) async {
    try {
      final respose = await userRef.where("id", isEqualTo: id).get();
      var user = respose.docs.single.data();
      // user.fcm = "";
      await userRef.doc(user.id).set(user);
      return user;
    } catch (err) {
      rethrow;
    }
  }
}
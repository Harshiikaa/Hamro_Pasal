import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hamropasal/Model/user_model.dart';
import 'package:hamropasal/repositories/auth_repositories.dart';

import '../services/service_management.dart';

class AuthViewModel with ChangeNotifier {
  User? _user = FirebaseService.firebaseAuth.currentUser;
  User? get user => _user;

  UserModel? _loggedInUser;
  UserModel? get LoggedInUser => _loggedInUser;

  Future<void> login(String email, String password) async {
    try {
      var response = await AuthRepository().login(email, password);
      _user = response.user;
      _loggedInUser = await AuthRepository().getUserDetail(_user!.uid);
      notifyListeners();
    } catch (err) {
      rethrow;
    }
  }
}

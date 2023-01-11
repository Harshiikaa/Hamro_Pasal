import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
//
// UserModel? productModelFromJson(String str) =>
//     UserModel.fromJson(json.decode(str));
//
// String productModelToJson(UserModel? data) => json.encode(data!.toJson());

class UserModel {
  String? id;
  String? fullname;
  String? email;
  String? password;

  UserModel(
      {this.id = '',
      required this.fullname,
      required this.email,
      required this.password});

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "email": email,
        "password": password,
      };
}

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel? productModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String productModelToJson(UserModel? data) => json.encode(data!.toJson());

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

  factory UserModel.fromFirebaseSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      UserModel(
        id: json.id,
        fullname: json["fullName"],
        email: json["email"],
        password: json["password"],
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      fullname: json["fullname"],
      email: json["email"],
      password: json["password"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "email": email,
        "password": password,
      };
}

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({Key? key}) : super(key: key);

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  Widget divider() {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Divider(
        thickness: 1.5,
      ),
    );
  }
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: Text('Change your Email'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        color: Color(0xFFD6D6D6),
        child: ListView(
          children: [
            colorTiles(),
          ],
        ),
      ),
      bottomNavigationBar: logoutButton(),
    );
  }
}

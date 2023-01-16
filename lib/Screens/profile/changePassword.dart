import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController currentPassword = new TextEditingController();
  TextEditingController newPassword = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();
  bool showPassword = false;
  bool checkedValue = true;
  @override
  Widget build(BuildContext context) {
    // var _isVisible = false;
    return Scaffold(
      appBar: AppBar(
        title: Text("Change password"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 35, 10, 35),
          child: Column(
            children: [
              Text(
                'Current Password',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 35),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: currentPassword,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "current password is required";
                      } else if (value != "currentPassword") {
                        return "your current password did not match";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[350],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Enter your current password"),
                  ),
                ),
              ),
              Text(
                'New Password',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 35.0),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: newPassword,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "new password is required";
                        // } else if (value != "email") {
                        //   return "Invalid email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[350],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Enter your new password"),
                  ),
                ),
              ),
              Text(
                'Confirm Password',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 35.0),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: confirmPassword,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "confirm password is required";
                      } else if (value != "createPassword") {
                        return "confirm password did not match with the created password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[350],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.lock),
                        hintText: "confirm your password"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {
                      Text("");
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => ProfileScreen(),
                      //   ),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        fixedSize: const Size(150, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

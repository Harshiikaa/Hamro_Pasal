import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'button_hover.dart';

void main() {
  runApp(const MyApps());
}

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hamro-Pasal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignupScreen(),
    );
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();

  void emailValidate() {
    final bool isValid = EmailValidator.validate(emailController.text.trim());

    if (isValid) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Valid email')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Invalid email')));
    }
  }

  late double _height;
  late double _width;

  bool isVisible = false;

  Widget passwordVisibility() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: IconButton(
        onPressed: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        icon: Icon(
          isVisible ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Container(
          width: _width,
          height: _height,
          child: Column(
            children: <Widget>[
              logo(),
              form(),
              signup(),
            ],
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return Container(
      height: _height * 0.35,
      child: Image.asset("assets/images/HamroPasal.png"),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          fullNameTextField(),
          SizedBox(height: 20.0),
          emailTextField(),
          SizedBox(height: 20.0),
          passwordTextField(),
          SizedBox(height: 20.0),
          confirmPasswordTextField(),
          SizedBox(height: 5.0),
        ],
      ),
    );
  }

  Widget fullNameTextField() {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffB4B4B4).withOpacity(0.4),
          borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
          autofocus: true,
          keyboardType: TextInputType.text,
          cursorColor: Colors.deepOrange,
          cursorHeight: 25,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.person,
              color: Colors.deepOrange,
              size: 25,
            ),
            hintText: "Enter full name",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black38)),
          )),
    );
  }

  Widget emailTextField() {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffB4B4B4).withOpacity(0.4),
          borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          cursorColor: Colors.deepOrange,
          cursorHeight: 25,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email_rounded,
              color: Colors.deepOrange,
              size: 25,
            ),
            hintText: "Enter your email",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black38)),
          )),
    );
  }

  Widget passwordTextField() {
    return Container(
      padding: EdgeInsets.only(right: 0),
      decoration: BoxDecoration(
          color: Color(0xffB4B4B4).withOpacity(0.4),
          borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
          keyboardType: TextInputType.text,
          cursorColor: Colors.deepOrange,
          cursorHeight: 25,
          obscureText: isVisible ? false : true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.deepOrange,
              size: 25,
            ),
            suffixIcon: passwordVisibility(),
            hintText: "Enter password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black38)),
          )),
    );
  }

  Widget confirmPasswordTextField() {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffB4B4B4).withOpacity(0.4),
          borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
          keyboardType: TextInputType.text,
          cursorColor: Colors.deepOrange,
          cursorHeight: 25,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.deepOrange,
              size: 25,
            ),
            suffixIcon: passwordVisibility(),
            hintText: "Confirm password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black38)),
          )),
    );
  }

  Widget signup() {
    return Container(
      width: _width / 1.2,
      margin: EdgeInsets.all(10),
      child: ButtonOnHover(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
            ),
            onPressed: () {
              setState(() {
                emailValidate();
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Signup',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );
  }
}

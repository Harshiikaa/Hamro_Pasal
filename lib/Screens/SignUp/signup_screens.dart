import 'package:flutter/material.dart';

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
  late double _height;
  late double _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        width: _width,
        height: _height,
        child: Column(
          children: <Widget>[
            logo(),
            form(),
          ],
        ),
      ),
    );
  }

  Widget logo() {
    return Container(
      height: _height * 0.45,
      child: Image.asset("assets/images/HamroPasal.png"),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 50.0),
      child: Column(
        children: <Widget>[
          firstNameTextField(),
          SizedBox(height: 10.0),
          lastNameTextField(),
        ],
      ),
    );
  }

  Widget firstNameTextField() {
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
              color: Colors.orange,
              size: 25,
            ),
            hintText: "Enter first name",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.orangeAccent)),
          )),
    );
  }

  Widget lastNameTextField() {
    return TextFormField(
      decoration: InputDecoration(label: Text('First Name')),
    );
  }
}

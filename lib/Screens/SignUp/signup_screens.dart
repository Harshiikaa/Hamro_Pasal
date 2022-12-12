import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formkey = GlobalKey<FormState>();

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
              backToLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return Expanded(
      flex: 2,
      child: Container(
        height: _height * 0.35,
        child: Image.asset("assets/images/HamroPasal.png"),
      ),
    );
  }

  Widget form() {
    return Expanded(
      flex: 4,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: formkey,
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
        ),
      ),
    );
  }

  Widget fullNameTextField() {
    return TextFormField(
      controller: fullNameController,
      autofocus: true,
      keyboardType: TextInputType.text,
      cursorColor: Colors.deepOrange,
      cursorHeight: 25,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[350],
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
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter full name";
        }
        return null;
      },
    );
  }

  Widget emailTextField() {
    return TextFormField(
        controller: emailController,
        validator: (value) {
          if (value != null || value!.isEmpty) {
            final bool isValid =
                EmailValidator.validate(emailController.text.trim());
            if (!isValid) {
              return "Invalid email";
            }
          }
        },
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.deepOrange,
        cursorHeight: 25,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[350],
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
        ));
  }

  Widget passwordTextField() {
    return TextFormField(
        controller: passwordController,
        validator: (PassCurrentValue) {
          RegExp regex = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
          var passNonNullValue = PassCurrentValue ?? "";
          if (passNonNullValue.isEmpty) {
            return ("Password is required");
          } else if (passNonNullValue.length < 6) {
            return ("Password Must be more than 5 characters");
          } else if (!regex.hasMatch(passNonNullValue)) {
            return ("Password should contain upper,lower,digit and Special character ");
          }
          return null;
        },
        keyboardType: TextInputType.text,
        cursorColor: Colors.deepOrange,
        cursorHeight: 25,
        obscureText: isVisible ? false : true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[350],
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
        ));
  }

  Widget confirmPasswordTextField() {
    return TextFormField(
        controller: confirmPasswordController,
        validator: (PassCurrentValue) {
          if (passwordController.text != confirmPasswordController.text) {
            return "password and confirm password must be same";
          }
          return null;
        },
        keyboardType: TextInputType.text,
        cursorColor: Colors.deepOrange,
        cursorHeight: 25,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[350],
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
        ));
  }

  Widget signup() {
    return Expanded(
      child: Container(
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
                if (formkey.currentState!.validate()) {
                  return;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Validation Unsuccessful")));
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Signup',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              )),
        ),
      ),
    );
  }

  Widget backToLogin() {
    return RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
            text: 'Already have an account? ',
            style: TextStyle(color: Colors.black, fontSize: 18),
            children: <TextSpan>[
              TextSpan(
                text: "Login",
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              )
            ]));
  }
}

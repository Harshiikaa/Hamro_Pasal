import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hamropasal/Screens/ForgotPassword/forgot_screen.dart';
import 'package:hamropasal/Screens/SignUp/signup_screens.dart';

import '../homeScreen/homeScreen.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({Key? key}) : super(key: key);

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  var _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: deviceHeight * 0.30,
                child: Image.asset('assets/images/HamroPasal.png'),
              ),
              Container(
                height: deviceHeight * 0.75,
                width: double.infinity,
                // color: Colors.yellow,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(builder: (ctx, constraints) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Login to your Account',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.04),
                      Container(
                        height: constraints.maxHeight * 0.12,
                        decoration: BoxDecoration(
                            color: Color(0xffB4B4B4).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'test@gmail.com',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.04),
                      Container(
                        height: constraints.maxHeight * 0.12,
                        decoration: BoxDecoration(
                            color: Color(0xffB4B4B4).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Center(
                            child: TextField(
                              obscureText: _isVisible ? false : true,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                    icon: Icon(
                                      _isVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Enter your password"),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ForgotScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.redAccent),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Container(
                        width: double.infinity,
                        height: constraints.maxHeight * 0.12,
                        margin: EdgeInsets.only(
                          top: constraints.maxHeight * 0.01,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HomeScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Text(
                        "or Login with ",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Image.asset(
                                'assets/images/2.png',
                                height: 60,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Image.asset(
                                'assets/images/google.png',
                                height: 60,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Image.asset(
                                'assets/images/twitter.png',
                                height: 60,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Dont have account? ",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: "Sign Up",
                              style: const TextStyle(
                                color: Colors.redAccent,
                                fontSize: 18,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => SignupScreen(),
                                    ),
                                  );
                                },
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

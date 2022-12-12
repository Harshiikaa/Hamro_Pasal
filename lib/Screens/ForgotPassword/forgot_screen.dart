import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  var _isVisible = false;

  TextEditingController email = TextEditingController();
  TextEditingController passoword = TextEditingController();
  final form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: form,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 110),
                  // color: Colors.blue,
                  height: deviceHeight * 0.50,
                  child: Image.asset(
                    'assets/images/HamroPasal.png',
                    height: 400,
                  ),
                ),
                Container(
                  height: deviceHeight * 0.60,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: LayoutBuilder(builder: (ctx, constraints) {
                    return SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Reset your password',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.04),
                          Container(
                            child: Center(
                              child: TextFormField(
                                controller: email,
                                validator: (String? value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value)) {
                                    return 'Please enter valid email';
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
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Color(0xFFF57C00),
                                    size: 25,
                                  ),
                                  hintText: 'Enter your email',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.04),
                          Container(
                            child: Center(
                              child: TextFormField(
                                controller: passoword,
                                validator: (PassCurrentValue) {
                                  RegExp regex = RegExp(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                  var passNonNullValue = PassCurrentValue ?? "";
                                  if (passNonNullValue.isEmpty) {
                                    return ("Password is required");
                                  } else if (passNonNullValue.length < 6) {
                                    return ("Password Must be more than 5 characters");
                                  } else if (!regex
                                      .hasMatch(passNonNullValue)) {
                                    return ("Password should contain upper,lower,digit and Special character ");
                                  }
                                  return null;
                                },
                                obscureText: _isVisible ? false : true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[350],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Color(0xFFF57C00),
                                      size: 25,
                                    ),
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
                                    hintText: "Enter new password"),
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: constraints.maxHeight * 0.14,
                            margin: EdgeInsets.only(
                              top: constraints.maxHeight * 0.05,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                if (form.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Reset successfully"),
                                    ),
                                  );
                                } else {
                                  print("Invalid Form");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFF57C00),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'Reset',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}

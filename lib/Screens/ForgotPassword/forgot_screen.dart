import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
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
                height: deviceHeight * 0.40,
                child: Image.asset('assets/images/HamroPasal.png'),
              ),
              Container(
                height: deviceHeight * 0.65,
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
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
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
    );
    ;
  }
}

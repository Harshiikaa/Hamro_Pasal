import 'package:flutter/material.dart';

import '../../widgets/homeappbar.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        HomeAppBar(),
        Container(
          //temporrary height
          height: 800,
          padding: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: Color(0xFFF57C00),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(35),
              topLeft: Radius.circular(35),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),

        )

      ],
      ),
    );
  }
}

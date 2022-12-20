import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Favorite"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Text(
          "Favorite Screen",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

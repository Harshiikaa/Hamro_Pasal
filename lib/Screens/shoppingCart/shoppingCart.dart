import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shopping Cart"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Text(
          "ShoppingCart Screen",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

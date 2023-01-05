import 'package:flutter/material.dart';
import 'package:hamropasal/Model/SingleProductModel.dart';

class CartScreen extends StatefulWidget {
  SingleProductModel data;
  CartScreen(this.data);

  void setName(data) {
    this.data = data;
  }

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart Section"),
        ),
        body: ListView(
          children: [],
        ));
  }
}

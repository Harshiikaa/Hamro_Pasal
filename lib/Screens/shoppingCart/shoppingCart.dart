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
  buildcartsection() {
    return Card(
      child: Container(
        height: 200,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          widget.data.productImage,
                          fit: BoxFit.cover,
                          width: 150,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart Section"),
        ),
        body: ListView(
          children: [
            buildcartsection(),
          ],
        ));
  }
}

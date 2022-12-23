import 'package:flutter/material.dart';
import '../../Model/SingleProductModel.dart';

class DetailScreen extends StatefulWidget {
  final SingleProductModel data;
  DetailScreen(this.data);
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  PreferredSize buildAppbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        title: Text("HamroPasal"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
    );
    ;
  }
}

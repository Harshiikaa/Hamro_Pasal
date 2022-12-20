import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({Key? key}) : super(key: key);

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("QR Code"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Text(
          "QR code Screen",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Model/Item_model.dart';

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FAQs'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: itemData.length,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 1,
              children: [
                ExpansionPanel(
                  body: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          itemData[index].discription,
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 15,
                              letterSpacing: 0.3,
                              height: 1.3),
                        ),
                      ],
                    ),
                  ),
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        itemData[index].headerItem,
                        style: TextStyle(
                          color: itemData[index].colorsItem,
                          fontSize: 18,
                        ),
                      ),
                    );
                  },
                  isExpanded: itemData[index].expanded,
                )
              ],
              expansionCallback: (int item, bool status) {
                setState(() {
                  itemData[index].expanded = !itemData[index].expanded;
                });
              },
            );
          },
        ),
      ),
    );
  }

  List<ItemModel> itemData = <ItemModel>[
    ItemModel(
      headerItem: 'What is HamroPasal',
      discription:
          "HamroPasal is a online platform to sell clothes of different categories.",
      colorsItem: Colors.green,
    ),
    ItemModel(
      headerItem: 'What are the services provided by HamroPasal',
      discription:
          "1. Buy clothes online. \n 2. Categoreis of clothers. \n 3. Password reset",
      colorsItem: Colors.green,
    ),
    ItemModel(
      headerItem: 'How can I register Hamropasal?',
      discription:
          "HamroPasal is a online platform to sell clothes of different categories.",
      colorsItem: Colors.green,
    ),
    ItemModel(
      headerItem: ' How to order/ buy?',
      discription:
          "This was probably the most popular question asked by people. Although we put a how to buy/ order tutorial button on every single product page with detailed step by step walk-through as well as video, yet that didn’t stop the customers from asking the question. As I have said earlier, Malaysian people were not used to the concept of e-shopping. They just simply hand over the money and get their choice of product. So, putting a lot of details and completing a set of steps for e-shopping seemed a bit hassling to them.",
      colorsItem: Colors.green,
    ),
  ];
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: ExpansionPanelDemo());
  }
}

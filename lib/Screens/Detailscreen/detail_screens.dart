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

  buildListTile() {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(
                color: Colors.orange,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.data.productName,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.data.productModel,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.data.productPrice.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.data.productOldPrice.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  buildProductImages() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              widget.data.productImage,
              fit: BoxFit.cover,
              width: 450,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 15, top: 15),
                  child: Image.network(widget.data.productSecondImage),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 15, top: 15),
                  child: Image.network(widget.data.productThirdImage),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 15, top: 15),
                  child: Image.network(widget.data.productFourImage),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  buildMayLikeYou() {
    return ListTile(
      leading: Text(
        "You may also like",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        "Show All",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
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

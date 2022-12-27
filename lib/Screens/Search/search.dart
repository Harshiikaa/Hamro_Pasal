import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Model/SingleProductModel.dart';
import '../Detailscreen/detail_screens.dart';
import '../homeScreen/homepage_data.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<SingleProductModel> _filteredProducts = [];
// Search query
  String _searchQuery = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (SingleProductModel product in _filteredProducts) {
      String productName = product.productName;
      String productImage = product.productImage;
      double productPrice = product.productPrice;

    }
    _filteredProducts = sigleProductData +
        colothsData +
        shoesData +
        accessoriesData +
        tshirtsData +
        pantsData;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}

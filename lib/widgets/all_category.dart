import 'package:flutter/material.dart';

import '../Model/SingleProductModel.dart';
import 'Single_product_widget.dart';

class TabBarBar extends StatelessWidget {
  final List<SingleProductModel> productData;
  // final List<CategoryProductModel> categoryProductData;
  TabBarBar({required this.productData});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      primary: true,
      itemCount: productData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.7),
      itemBuilder: (context, index) {
        var data = productData[index];
        return SingleProductWidget(
          onPressed: () {
            // PageRouting.goToNextPage(
            //   context: context,
            //   navigateTo: DetailScreen(data: data),
            // );
          },
          productImage: data.productImage,
          productModel: data.productModel,
          productName: data.productName,
          productOldPrice: data.productOldPrice,
          productPrice: data.productPrice,
        );
      },
    );
  }
}

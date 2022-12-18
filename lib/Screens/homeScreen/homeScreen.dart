import 'package:flutter/material.dart';

import '../../Model/SingleProductModel.dart';
import '../../widgets/Single_product_widget.dart';
import '../../widgets/all_category.dart';
import '../../widgets/homeappbar.dart';
import '../../widgets/show_allwidgets.dart';
import 'homepage_data.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  static SingleProductModel? signleProductModel;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}

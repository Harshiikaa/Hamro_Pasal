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

  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HomeAppBar(),
          Container(
            //temporrary height
            height: 800,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFF57C00),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                topLeft: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search your product...",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      TabBar(
                        labelPadding: EdgeInsets.symmetric(horizontal: 18),
                        indicator: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelColor: Colors.white54,
                        labelColor: Colors.white,
                        indicatorWeight: 5,
                        indicatorColor: Colors.white,
                        indicatorPadding: EdgeInsets.all(10),
                        controller: tabController,
                        tabs: [
                          Tab(
                            text: 'All',
                          ),
                          Tab(
                            text: 'Hoodies',
                          ),
                          Tab(
                            text: 'Shoes',
                          ),
                          Tab(
                            text: 'Bags',
                          ),
                          Tab(
                            text: 'T-shirt',
                          ),
                          Tab(
                            text: 'Pants',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          ShowAllWidget(
                            leftText: "Trending Products",
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: GridView.builder(
                              shrinkWrap: true,
                              primary: true,
                              itemCount: sigleProductData.length,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.7,
                                mainAxisExtent: 350,
                              ),
                              itemBuilder: (context, index) {
                                var arrivalDataStore = sigleProductData[index];

                                return SingleProductWidget(
                                  productImage: arrivalDataStore.productImage,
                                  productModel: arrivalDataStore.productModel,
                                  productName: arrivalDataStore.productName,
                                  productOldPrice:
                                      arrivalDataStore.productOldPrice,
                                  productPrice: arrivalDataStore.productPrice,
                                  onPressed: () {},
                                  // onPressed: () {
                                  //   PageRouting.goToNextPage(
                                  //     context: context,
                                  //     navigateTo: DetailScreen(
                                  //       data: arrivalDataStore,
                                  //     ),
                                  //   );
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      TabBarBar(
                        productData: colothsData,
                      ),
                      TabBarBar(
                        productData: shoesData,
                      ),
                      TabBarBar(
                        productData: accessoriesData,
                      ),
                      TabBarBar(
                        productData: tshirtsData,
                      ),
                      TabBarBar(
                        productData: pantsData,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          child: Icon(
            Icons.qr_code,
            size: 40,
          ),
          onPressed: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (BuildContext context) => QRCodeScreen(),
            //   ),
            // );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

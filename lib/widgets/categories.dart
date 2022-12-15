import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = [
    'All',
    'Hoodies',
    'Shoes',
    'Bags',
    'Perfumes',
    'Jeans'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,

        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex=index;
                });
              },
            );
          },
        )
    );
  }
}
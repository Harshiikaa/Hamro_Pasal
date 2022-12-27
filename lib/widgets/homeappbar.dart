import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../Screens/Search/search.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            SizedBox(
              height: 50,
            ),
            // Image(
            //   image: AssetImage('images/logo.png'),
            // ),
            Icon(
              Icons.shopping_cart,
              size: 40,
              color: Color(0xFFF57C00),
            ),
            Text(
              "HamroPasal",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF57C00)),
            ),
            Spacer(),
            IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SearchPage()));
            }, icon: Icon(Icons.search,size: 30,color: Color(0xFFF57C00),)),
            Badge(
              badgeColor: Colors.red,
              padding: EdgeInsets.all(7),
              badgeContent: Text(
                "3",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 30,
                  color: Color(0xFFF57C00),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

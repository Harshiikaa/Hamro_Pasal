// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class FavoriteScreen extends StatefulWidget {
//   const FavoriteScreen({Key? key}) : super(key: key);
//
//   @override
//   State<FavoriteScreen> createState() => _FavoriteScreenState();
// }
//
// class _FavoriteScreenState extends State<FavoriteScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Favorite"),
//         backgroundColor: Colors.deepOrange,
//       ),
//       body: Center( child:Expanded(
//         child: ListView.builder(
//           itemCount: ,
//           itemBuilder: (context, index) => Card(
//             elevation: 1,
//             margin: const EdgeInsets.symmetric(vertical: 2),
//             child: ListTile(
//               leading: CircleAvatar(
//                 radius: 30.0,
//                 backgroundImage: NetworkImage(
//                     _filteredProducts[index].productImage),
//                 backgroundColor: Colors.transparent,
//               ),
//               title: Text(_filteredProducts[index].productName),
//               subtitle: Text(
//                   'Price: ${_filteredProducts[index].productPrice}'),
//             ),
//           ),
//         ),
//       ),),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hamropasal/Model/SingleProductModel.dart';
import 'package:hamropasal/Screens/Detailscreen/detailscreen_data.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Hamro-Pasal',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: FavoriteScreen(),
//     );
//   }
// }

class FavoriteScreen extends StatefulWidget {
  // final SingleProductModel? data;
  // FavoriteScreen(this.data);

  // const FavoriteScreen({Key? key, this.data}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  Map<String, dynamic> someMap = {};
  someMethod() {
    someMap.addAll({'': 'test@gmail.com'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text("Favorite"),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => const Card(
          elevation: 1,
          margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          color: Colors.white,
          child: ListTile(
            hoverColor: Colors.white54,
            // shape: RoundedRectangleBorder(
            //     side: BorderSide(width: 1),
            //     borderRadius: BorderRadius.circular(3)),
            leading: CircleAvatar(
              radius: 30.0,
              // backgroundImage: NetworkImage(widget.data.productName),
              backgroundColor: Colors.transparent,
            ),
            // title: Text(data.productName),
            subtitle: Text('Price: ${2342}'),
            trailing: Icon(
              Icons.favorite,
              color: Colors.black38,
            ),
            dense: true,
            contentPadding: EdgeInsets.only(left: 13.0, right: 19.0),
          ),
        ),
      ),
    );
  }
}

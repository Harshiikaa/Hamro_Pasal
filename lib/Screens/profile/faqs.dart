import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hamro-Pasal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FrequentlyAskedQuestions(),
    );
  }
}

class FrequentlyAskedQuestions extends StatefulWidget {
  const FrequentlyAskedQuestions({Key? key}) : super(key: key);

  @override
  State<FrequentlyAskedQuestions> createState() =>
      _FrequentlyAskedQuestionsState();
}

class _FrequentlyAskedQuestionsState extends State<FrequentlyAskedQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAQs")),
      body: const ExpansionTile(
        title: Text(
          "What is Hamropasal?",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        children: [
          ListTile(
            title: Text(
              "this is ecommerce website which perform seel and buy of things online.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
            ),
          )
        ],
      ),
    );
  }
}

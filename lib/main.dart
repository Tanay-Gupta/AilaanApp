import 'package:contestalert/screens/codeChefPage.dart';
import 'package:contestalert/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contest Alert',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

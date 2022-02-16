import 'package:contestalert/screens/homePageItems/seeal.dart';
import 'package:contestalert/screens/homepage.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.white));

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
      // home: HomePage(),
      routes: {
        '/': (context) => const HomePage(),
        '/allcontest': (context) => const SeeAll()
        // '/browser': (context) => InAppBro(),
      },
    );
  }
}

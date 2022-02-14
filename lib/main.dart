import 'package:contestalert/screens/homepage.dart';
import 'package:contestalert/screens/showplatformcontest.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarColor: Colors.white));

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
        '/': (context) => HomePage(),
        //  '/allcontest': (context) => CodechefPage()
        // '/browser': (context) => InAppBro(),
      },
    );
  }
}

import 'package:contestalert/screens/drawerscreen.dart';
import 'package:contestalert/screens/homepage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: const [
        DrawerScreen(),
        HomePage(),
      ],
    ));
  }
}

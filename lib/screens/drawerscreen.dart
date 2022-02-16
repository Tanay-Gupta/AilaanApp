import 'package:contestalert/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 40, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Lottie.asset(
                  "assets/animations/profile.json",
                  height: 50,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Ailaan',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: const <Widget>[
                // NewRow(
                //   text: 'My Account',
                //   icon: Icons.person_outline,
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                NewRow(
                  text: 'Settings',
                  icon: Icons.settings,
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(text: 'Notifications', icon: Icons.notifications),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  text: 'About Dev',
                  icon: Icons.code,
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  text: 'Help Center',
                  icon: Icons.help,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.cancel,
                  color: Colors.white.withOpacity(0.0),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Log out',
                  style: TextStyle(color: Colors.white.withOpacity(0.0)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NewRow extends StatelessWidget {
  final IconData? icon;
  final String? text;

  const NewRow({
    Key? key,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          text!,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}

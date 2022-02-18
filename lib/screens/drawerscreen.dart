import 'package:contestalert/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
        padding: const EdgeInsets.only(top: 50, left: 40, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset('assets/icons/logo.svg',
                      height: 90, semanticsLabel: 'logo'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Ailaan',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            Column(
              children: <Widget>[
                // NewRow(
                //   text: 'My Account',
                //   icon: Icons.person_outline,
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // NewRow(
                // //   text: 'Settings',
                // //   icon: Icons.settings,
                // // ),
                // SizedBox(
                //   height: 20,
                // ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/upcoming');
                    },
                    child: const NewRow(
                        text: 'Upcoming Contest', icon: Icons.calendar_today)),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/aboutme');
                  },
                  child: const NewRow(
                    text: 'About Dev',
                    icon: Icons.code,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/privacy");
                  },
                  child: const NewRow(
                    text: 'Privacy Policy',
                    icon: Icons.policy,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/terms");
                  },
                  child: const NewRow(text: 'Terms', icon: Icons.book),
                ),
                const SizedBox(
                  height: 20,
                ),
                // InkWell(
                //   onTap: () {
                //     Alert(
                //       context: context,
                //       title: "Disclaimer",
                //       style: AlertStyle(titleStyle: kTitleTextStyle),
                //       padding: EdgeInsets.all(30),
                //       content: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.end,
                //         children: <Widget>[
                //           SizedBox(
                //             height: 20,
                //           ),
                //           Text(
                //             "This is not an official App provided by any coding platform. Neither this app nor the developer are affiliated with Codechef, Codeforces, Kickstart, Hackerrank, HackerEarth, ATcoder, csAcademy, LeetCode, TopCoder.\n\nThe user shall be held solely responsible for any damage that could be done by it's reproduction and/or use.\n\n Happy Coding 😊",
                //             style: kSubtitleTextSyle.copyWith(
                //                 fontSize: 17, overflow: TextOverflow.visible),
                //           ),
                //         ],
                //       ),
                //     ).show();
                //   },
                //   child: const NewRow(
                //     text: 'Disclaimer',
                //     icon: Icons.warning,
                //   ),
                // ),
              ],
            ),
            // const SizedBox(
            //   height: 150,
            // ),
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

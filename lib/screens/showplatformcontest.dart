import 'package:contestalert/screens/showPlatformItems/liveAndUpcomingContest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class ContestDetailsScreen extends StatelessWidget {
  final String contestUrl;
  final String contestName;
  final String contestImageUrl;
  final String contestSiteUrl;

  const ContestDetailsScreen(
      {Key? key,
      required this.contestUrl,
      required this.contestSiteUrl,
      required this.contestImageUrl,
      required this.contestName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF5F4EF),
          // image: DecorationImage(
          //   image: AssetImage("assets/images/ux_big.png"),
          //   alignment: Alignment.topRight,
          // ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            // color: Colors.green,
                            height: 30,
                            width: 30,
                            child: SvgPicture.asset(
                              "assets/icons/arrow-left.svg",
                            )),
                      ),
                      SvgPicture.asset(
                        "assets/icons/more-vertical.svg",
                        height: 30,
                        width: 30,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SvgPicture.asset(
                    contestImageUrl,
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 16),
                  Text(contestName,
                      style: kHeadingextStyle.copyWith(fontSize: 35)),
                  const SizedBox(height: 16),
                  Text(contestSiteUrl),
                  const SizedBox(height: 80),
                ],
              ),
            ),
            //  SizedBox(height: 60),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Contest details", style: kTitleTextStyle),
                      SizedBox(height: 15),
                      Expanded(
                          child: LiveAndUpcomingContest(
                        contestUrl: contestUrl,
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

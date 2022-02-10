import 'package:carousel_slider/carousel_slider.dart';
import 'package:contestalert/screens/homePageItems/livecontest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 0, top: 50, right: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/allcontest");
                      },
                      child: SvgPicture.asset("assets/icons/menu.svg")),
                  Image.asset("assets/images/user.png"),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text("Hey Tanay,", style: kHeadingextStyle),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text("Let's explore contest happening around",
                  style: kSubheadingextStyle),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Platforms", style: kTitleTextStyle),
                    Text(
                      "See All",
                      style: kSubtitleTextSyle.copyWith(color: kBlueColor),
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 120,
                aspectRatio: 16 / 9,
                viewportFraction: 0.4,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
              ),
              itemCount: contestName.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      InkWell(
                borderRadius: BorderRadius.circular(15.0),
                splashColor: kBlueColor,
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                        color: kBlueColor.withOpacity(.05),
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15.0)),
                    height: 120,
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          pictureId[contestName[itemIndex]].toString(),
                          height: 40,
                          width: 40,
                        ),
                        Text(contestName[itemIndex],
                            style: kSubheadingextStyle),
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Text("Live Contests", style: kTitleTextStyle),
                SizedBox(
                  width: 5,
                ),
                Lottie.asset(livePulseAnimation, height: 20)
              ]),
            ),
            Expanded(flex: 1, child: LiveContest()),
          ],
        ),
      ),
    );
  }
}

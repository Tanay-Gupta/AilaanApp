import 'package:carousel_slider/carousel_slider.dart';
import 'package:contestalert/screens/homePageItems/livecontest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
            SizedBox(height: 30),
            Text("Hey Tanay,", style: kHeadingextStyle),
            Text("Let's explore what's happening nearby",
                style: kSubheadingextStyle),
            SizedBox(
              height: 60,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Platforms", style: kTitleTextStyle),
                  Text(
                    "See All",
                    style: kSubtitleTextSyle.copyWith(color: kBlueColor),
                  ),
                ]),
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
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              itemCount: 15,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                height: 120,
                width: 120,
                color: kBlueColor,
                child: Text(itemIndex.toString()),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Live Contests", style: kTitleTextStyle),
            SizedBox(
              height: 5,
            ),
            Expanded(child: LiveContest()),
          ],
        ),
      ),
    );
  }
}

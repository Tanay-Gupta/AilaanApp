import 'package:carousel_slider/carousel_slider.dart';
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
                SvgPicture.asset("assets/icons/menu.svg"),
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
              height: 15,
            ),
            Expanded(
                child: SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  CourseContent(
                    number: "01",
                    duration: 5.35,
                    title: "Welcome to the Course",
                    isDone: true,
                  ),
                  CourseContent(
                    number: '02',
                    duration: 19.04,
                    title: "Design Thinking - Intro",
                    isDone: true,
                  ),
                  CourseContent(
                    number: '03',
                    duration: 15.35,
                    title: "Design Thinking Process",
                  ),
                  CourseContent(
                    number: '04',
                    duration: 5.35,
                    title: "Customer Perspective",
                  ),
                  CourseContent(
                    number: "01",
                    duration: 5.35,
                    title: "Welcome to the Course",
                    isDone: true,
                  ),
                  CourseContent(
                    number: '02',
                    duration: 19.04,
                    title: "Design Thinking - Intro",
                    isDone: true,
                  ),
                  CourseContent(
                    number: '03',
                    duration: 15.35,
                    title: "Design Thinking Process",
                  ),
                  CourseContent(
                    number: '04',
                    duration: 5.35,
                    title: "Customer Perspective",
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class CourseContent extends StatelessWidget {
  final String number;
  final double? duration;
  final String? title;
  final bool isDone;
  const CourseContent({
    Key? key,
    required this.number,
    this.duration,
    this.title,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: <Widget>[
          Text(
            number,
            style: kHeadingextStyle.copyWith(
              color: kTextColor.withOpacity(.15),
              fontSize: 32,
            ),
          ),
          SizedBox(width: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$duration mins\n",
                  style: TextStyle(
                    color: kTextColor.withOpacity(.5),
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: title,
                  style: kSubtitleTextSyle.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kGreenColor.withOpacity(isDone ? 1 : .5),
            ),
            child: Icon(Icons.play_arrow, color: Colors.white),
          )
        ],
      ),
    );
  }
}

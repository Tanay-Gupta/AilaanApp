import 'package:carousel_slider/carousel_slider.dart';
import 'package:contestalert/screens/homePageItems/livecontest.dart';
import 'package:contestalert/screens/showplatformcontest.dart';
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
  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          setState(() {
            xOffset = 0;
            yOffset = 0;
            isDrawerOpen = false;
          });

          return false;
        }

        //print("back button pressed");
        return true;
      },
      child: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(isDrawerOpen ? 0.85 : 1.00)
          ..rotateZ(isDrawerOpen ? -50 : 0),
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          //  color: Colors.white,
          color: Color(0xFFF5F5F5),

          borderRadius: isDrawerOpen
              ? BorderRadius.circular(40)
              : BorderRadius.circular(0),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 0, top: 25, right: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      isDrawerOpen
                          ? GestureDetector(
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  child: Icon(Icons.arrow_back_ios)),
                              onTap: () {
                                setState(() {
                                  xOffset = 0;
                                  yOffset = 0;
                                  isDrawerOpen = false;
                                });
                              },
                            )
                          : GestureDetector(
                              child: Container(
                                height: 40,
                                width: 40,
                                child: SvgPicture.asset(
                                  "assets/icons/menu.svg",
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  xOffset = 290;
                                  yOffset = 80;
                                  isDrawerOpen = true;
                                });
                              },
                            ),
                      // InkWell(
                      //     onTap: () {
                      //       setState(() {
                      //         xOffset = 290;
                      //         yOffset = 80;
                      //         isDrawerOpen = true;
                      //       });
                      //     },
                      //     child: SvgPicture.asset(
                      //       "assets/icons/menu.svg",
                      //       width: 25,
                      //       height: 25,
                      //     )),
                      // ClipRRect(
                      //   child: Image.asset(
                      //     "assets/images/user.png",
                      //     height: 30,
                      //   ),
                      // ),

                      Lottie.asset(
                        "assets/animations/profile.json",
                        fit: BoxFit.fitHeight,
                        height: 50,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text("Hey Geek,", style: kHeadingextStyle),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text("Let's explore contest happening around",
                      style: kSubheadingextStyle),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text("Platforms", style: kTitleTextStyle),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/allcontest');
                          },
                          child: Text(
                            "See All",
                            style:
                                kSubtitleTextSyle.copyWith(color: kBlueColor),
                          ),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 160,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 120,
                      aspectRatio: 16 / 9,
                      disableCenter: false,
                      viewportFraction: 0.38,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: contestName.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        InkWell(
                      borderRadius: BorderRadius.circular(15.0),
                      // co
                      splashColor: kBlueColor,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContestDetailsScreen(
                              contestSiteUrl:
                                  contestWebsiteUrl[contestName[itemIndex]]
                                      .toString(),
                              contestImageUrl:
                                  pictureId[contestName[itemIndex]].toString(),
                              contestName: contestName[itemIndex],
                              contestUrl:
                                  contestNameWithUrl[contestName[itemIndex]]
                                      .toString(),
                            ),
                          ),
                        );
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              // color: kBlueColor.withOpacity(.2),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    offset: const Offset(4.0, 4.0),
                                    blurRadius: 12.0,
                                    spreadRadius: 1.0),
                                const BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-4.0, -4.0),
                                    blurRadius: 12.0,
                                    spreadRadius: 1.0),
                              ],
                              //border: Border.all(color: Colors.grey),
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
                                  style: kSubheadingextStyle.copyWith(
                                      overflow: TextOverflow.visible)),
                            ],
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 13),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Live Contests", style: kTitleTextStyle),
                        const SizedBox(
                          width: 5,
                        ),
                        Lottie.asset(livePulseAnimation, height: 20)
                      ]),
                ),
                const Expanded(flex: 1, child: LiveContest()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../showplatformcontest.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: const Color(0xFFF5F4EF),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                          // color: Colors.green,
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset(
                            "assets/icons/arrow-left.svg",
                          )),
                    ),
                    const Text(
                      "All Platforms",
                      style: kHeadingextStyle,
                    ),
                    const Icon(
                      Icons.menu,
                      color: Colors.transparent,
                    )
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 40,
              // ),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: contestName.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, itemIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
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
                                    pictureId[contestName[itemIndex]]
                                        .toString(),
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
                                //  color: kBlueColor.withOpacity(.2),
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
                            height: 100,
                            width: 100,
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
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

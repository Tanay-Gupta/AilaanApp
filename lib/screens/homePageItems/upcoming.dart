import 'package:contestalert/screens/homePageItems/upcomingContets/upcomingContestList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class UpcomingContest extends StatelessWidget {
  const UpcomingContest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
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
                      "Upcoming Contests",
                      style: kHeadingextStyle,
                    ),
                    const Icon(
                      Icons.menu,
                      color: Colors.transparent,
                    )
                  ],
                ),
              ),
              Expanded(child: UpComingList())
            ],
          ),
        ),
      ),
    );
  }
}

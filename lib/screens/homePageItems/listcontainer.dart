import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants.dart';

class ListContainer extends StatelessWidget {
  final String number;
  final String? duration;
  final String? title;
  final bool isDone;
  final String imgUrl;
  final String startTime;
  final String endTime;
  final String durationInHr;
  final String contestUrl;
  const ListContainer({
    Key? key,
    required this.number,
    required this.durationInHr,
    required this.startTime,
    required this.endTime,
    required this.imgUrl,
    required this.contestUrl,
    this.duration,
    this.title,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: InkWell(
        onTap: () {
          Alert(
              context: context,
              title: "$title",
              style: AlertStyle(
                  titleStyle:
                      kTitleTextStyle.copyWith(overflow: TextOverflow.visible)),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Start: $startTime\n\nEnd: $endTime\n\nTime: $durationInHr Hr",
                    style: kSubtitleTextSyle.copyWith(fontSize: 17),
                  ),
                ],
              ),
              buttons: [
                DialogButton(
                  color: kBlueColor,
                  onPressed: () async {
                    if (!await launch(contestUrl))
                      throw 'Could not launch $contestUrl';
                  },
                  child: Text(
                    'Open site',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ]).show();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  number,
                  style: kHeadingextStyle.copyWith(
                    color: kTextColor.withOpacity(.15),
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .030,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .63,
                  // color: Colors.red,
                  // child: RichText(
                  //   overflow: TextOverflow.ellipsis,
                  //   text: TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         text: "ends $duration\n",
                  //         style: TextStyle(
                  //           color: kTextColor.withOpacity(.5),
                  //           fontSize: 17.5,
                  //         ),
                  //       ),
                  //       TextSpan(
                  //         text: title,
                  //         style: kSubtitleTextSyle.copyWith(
                  //           fontWeight: FontWeight.w600,
                  //           height: 1.5,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title.toString(),
                        style: kSubtitleTextSyle.copyWith(
                          overflow: TextOverflow.visible,
                          //fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "ends on $duration",
                        style: TextStyle(
                            color: kTextColor.withOpacity(.5),
                            //fontSize: 13.5,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              // color: Colors.blueAccent,
              //margin: EdgeInsets.only(left: 2),
              height: 40,
              width: 40,
              child: SvgPicture.asset(imgUrl),
            )
          ],
        ),
      ),
    );
  }
}

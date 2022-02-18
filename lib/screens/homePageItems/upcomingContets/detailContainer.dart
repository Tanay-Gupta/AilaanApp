import 'package:contestalert/services/notification_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants.dart';

import 'package:flutter_web_browser/flutter_web_browser.dart';

class DetailContainer extends StatelessWidget {
  final String number;
  final String? duration;
  final String? title;
  final bool isDone;
  final String imgUrl;
  final String startTime;
  final String endTime;
  final String durationInHr;
  final String contestUrl;
  const DetailContainer({
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

  String utcToLocal(String utc) {
    utc = utc.substring(0, 10) + "T" + utc.substring(11, 19) + ".000Z";

    var strToDateTime = DateTime.parse(utc);
    final convertLocal = strToDateTime.toLocal();
    var newFormat = DateFormat("dd-MM-yyyy hh:mm aaa");
    String updatedDt = newFormat.format(convertLocal);
    return (updatedDt);
  }

  DateTime dateSub(String utc) {
    utc = utc.substring(0, 10) + "T" + utc.substring(11, 19) + ".000Z";

    var strToDateTime = DateTime.parse(utc);
    final convertLocal = strToDateTime.toLocal();
    return (convertLocal);
  }

  @override
  Widget build(BuildContext context) {
    String starttime = utcToLocal(startTime);
    String endtime = utcToLocal(endTime);
    String durationInhour = Duration(
            seconds: int.parse(durationInHr.indexOf('.') != -1
                ? durationInHr.substring(0, durationInHr.indexOf('.') - 1)
                : durationInHr))
        .inHours
        .toString();
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
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Start: $starttime\n\nEnd: $endtime\n\nTime: $durationInhour Hr",
                    style: kSubtitleTextSyle.copyWith(fontSize: 17),
                  ),
                ],
              ),
              buttons: [
                DialogButton(
                  color: kBlueColor,
                  onPressed: () async {
                    FlutterWebBrowser.openWebPage(
                      url: contestUrl,
                      customTabsOptions: const CustomTabsOptions(
                        colorScheme: CustomTabsColorScheme.dark,
                        shareState: CustomTabsShareState.on,
                        instantAppsEnabled: true,
                        showTitle: true,
                        urlBarHidingEnabled: true,
                      ),
                    );
                  },
                  child: Text(
                    'Open site',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                DialogButton(
                  color: kBlueColor,
                  onPressed: () async {
                    NotificationApi.showScheduledNotification(
                        id: title.hashCode,
                        title: "Hey Buddy! 👋",
                        body: title! + " will start in 24 hour",
                        schedule:
                            dateSub(startTime).subtract(Duration(hours: 24)),
                        payload: 'Ailaan.internal');
                    NotificationApi.showScheduledNotification(
                        id: (title! + startTime).hashCode,
                        title: "Hey Buddy! 👋",
                        body: title! + " will start in 1 hour",
                        schedule:
                            dateSub(startTime).subtract(Duration(hours: 1)),
                        payload: 'Ailaan.internal');
                    NotificationApi.showScheduledNotification(
                        id: (title! + endTime).hashCode,
                        title: "Hey Buddy! 👋",
                        body: "$title will start in 5 min. All the Best 🤗",
                        schedule:
                            dateSub(startTime).subtract(Duration(minutes: 5)),
                        payload: 'Ailaan.internal');

                    Navigator.pop(context);
                    Fluttertoast.showToast(
                        msg: "Reminder set successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                  child: Text(
                    'Remind',
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
                // Text(
                //   number,
                //   style: kHeadingextStyle.copyWith(
                //     color: kTextColor.withOpacity(.15),
                //     fontSize: 32,
                //   ),
                // ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width * .030,
                // ),
                Container(
                  // color: Colors.red,
                  width: MediaQuery.of(context).size.width * .7,
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
                        "Starts on $starttime",
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

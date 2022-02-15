import 'package:contestalert/services/notification_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../constants.dart';
import 'package:intl/intl.dart';

class ContestDetailContainer extends StatelessWidget {
  final String number;
  final String? duration;
  final String? title;
  final bool isLive;
  final String startTime;
  final String endTime;
  final String durationInHr;
  final String contestUrl;

  // final String imgUrl;
  const ContestDetailContainer({
    Key? key,
    required this.number,
    required this.contestUrl,
    required this.durationInHr,
    required this.startTime,
    required this.endTime,
    // required this.imgUrl,
    this.duration,
    this.title,
    this.isLive = false,
  }) : super(key: key);

  DateTime dateSub(String utc) {
    utc = utc.substring(0, 10) + "T" + utc.substring(11, 19) + ".000Z";

    var strToDateTime = DateTime.parse(utc);
    final convertLocal = strToDateTime.toLocal();
    return (convertLocal);
  }

  String utcToLocal(String utc) {
    utc = utc.substring(0, 10) + "T" + utc.substring(11, 19) + ".000Z";

    var strToDateTime = DateTime.parse(utc);
    final convertLocal = strToDateTime.toLocal();

    var newFormat = DateFormat("dd-MM-yyyy hh:mm aaa");
    String updatedDt = newFormat.format(convertLocal);
    return (updatedDt);
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

    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: InkWell(
          // highlightColor: Colors.transparent,
          onTap: () {
            Alert(
                context: context,
                title: "$title",
                style: AlertStyle(
                    titleStyle: kTitleTextStyle.copyWith(
                        overflow: TextOverflow.visible)),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Start: $starttime\n\nEnd: $endtime\n\nDuration: $durationInhour Hour",
                      style: kSubtitleTextSyle.copyWith(fontSize: 17),
                    ),
                  ],
                ),
                buttons: [
                  DialogButton(
                    color: kBlueColor,
                    onPressed: isLive
                        ? () async {
                            FlutterWebBrowser.openWebPage(
                                url: contestUrl,
                                customTabsOptions: const CustomTabsOptions(
                                  colorScheme: CustomTabsColorScheme.dark,
                                  shareState: CustomTabsShareState.on,
                                  instantAppsEnabled: true,
                                  showTitle: true,
                                  urlBarHidingEnabled: true,
                                ));

                            // if (!await launch(contestUrl))
                            //   throw 'Could not launch $contestUrl';
                          }
                        : () {
                            // String body = ;
                            NotificationApi.showScheduledNotification(
                                id: title.hashCode,
                                title: "Hey Coder! 👋",
                                body: title! + " will start in 24 hour",
                                schedule: dateSub(startTime)
                                    .subtract(Duration(hours: 24)),
                                payload: 'tanay.abs');
                            NotificationApi.showScheduledNotification(
                                id: (title! + startTime).hashCode,
                                title: "Hey Coder! 👋",
                                body: title! + " will start in 1 hour",
                                schedule: dateSub(startTime)
                                    .subtract(Duration(hours: 1)),
                                payload: 'tanay.abs');
                            NotificationApi.showScheduledNotification(
                                id: (title! + endTime).hashCode,
                                title: "Hey Coder! 👋",
                                body:
                                    "$title will start in 5 min. All the Best 🤗",
                                schedule: dateSub(startTime)
                                    .subtract(Duration(minutes: 5)),
                                payload: 'tanay.abs');

                            Navigator.pop(context);
                          },
                    child: Text(
                      isLive == false ? 'Set Reminder' : 'Open site',
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
                    width: MediaQuery.of(context).size.width *
                        (isLive == true ? 0.63 : 0.72),
                    //color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title.toString(),
                          style: kSubtitleTextSyle.copyWith(
                            overflow: TextOverflow.visible,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          isLive == true
                              ? "Ends on $endtime"
                              : "Starts at $starttime",
                          style: TextStyle(
                              color: kTextColor.withOpacity(.5),
                              fontSize: 13.5,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              isLive == true
                  ? Lottie.asset("assets/animations/41843-live-stream.json",
                      height: 25, width: 25)
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:contestalert/constants.dart';
import 'package:contestalert/screens/showPlatformItems/contestDetailContainer.dart';
import 'package:contestalert/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LiveAndUpcomingContest extends StatefulWidget {
  final String contestUrl;
  const LiveAndUpcomingContest({Key? key, required this.contestUrl})
      : super(key: key);

  @override
  _LiveAndUpcomingContestState createState() => _LiveAndUpcomingContestState();
}

class _LiveAndUpcomingContestState extends State<LiveAndUpcomingContest> {
  late Future<List> futurelist;
  APIManager? ob;
  String contestUrl = '';

  @override
  void initState() {
    contestUrl = widget.contestUrl;
    APIManager ob = new APIManager(false, widget.contestUrl);
    futurelist = ob.getDataAsList();

    super.initState();
  }

  String DurationExtract(String start) {
    return (start.substring(8, 10) +
        "-" +
        start.substring(5, 7) +
        "-" +
        start.substring(0, 4));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          ob = new APIManager(false, widget.contestUrl);
          futurelist = ob!.getDataAsList();
        });
      },
      child: FutureBuilder<List>(
        future: futurelist,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.length > 0) {
              return ListView.builder(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ContestDetailContainer(
                      contestUrl: snapshot.data![index].url.toString(),
                      startTime: snapshot.data![index].startTime,
                      endTime: snapshot.data![index].endTime,
                      durationInHr: snapshot.data![index].duration,
                      number: (index + 1) < 10
                          ? '0' + (index + 1).toString()
                          : (index + 1).toString(),
                      duration: DurationExtract(snapshot.data![index].startTime
                              .toString()
                              .substring(0, 10)) +
                          ' to ' +
                          DurationExtract(snapshot.data![index].endTime
                              .toString()
                              .substring(0, 10)),
                      isLive: snapshot.data![index].status == 'CODING'
                          ? true
                          : false,
                      title: snapshot.data![index].name,
                    );
                  });
            } else {
              return Center(
                  child: Lottie.asset("assets/animations/nodatafound2.json",
                      height: 400, width: 400));
            }
          } else {
            return Center(
                child: Lottie.asset(loadingAnimation, height: 200, width: 200));
          }
        },
      ),
    );
  }
}

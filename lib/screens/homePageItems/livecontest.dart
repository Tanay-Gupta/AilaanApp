import 'package:contestalert/constants.dart';
import 'package:contestalert/screens/widgets/listcontainer.dart';
import 'package:contestalert/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LiveContest extends StatefulWidget {
  const LiveContest({Key? key}) : super(key: key);

  @override
  _LiveContestState createState() => _LiveContestState();
}

class _LiveContestState extends State<LiveContest> {
  late Future<List> futurelist;
  APIManager ob = new APIManager(true, allContestUrl);
  @override
  void initState() {
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
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: RefreshIndicator(
        onRefresh: () async {
          futurelist = ob.getDataAsList();
        },
        child: FutureBuilder<List>(
          future: futurelist,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    // FOR RUNNING CONTEST USE 'CODING'
                    // 'BEFORE' FOR UPCOMING CONTESTs

                    if (snapshot.data![index].status == 'CODING') {
                      String imgurl = snapshot.data![index].site;

                      return ListContainer(
                        imgUrl: pictureId[imgurl].toString(),
                        number: (index + 1) < 10
                            ? '0' + (index + 1).toString()
                            : (index + 1).toString(),
                        duration: DurationExtract(snapshot.data![index].endTime
                            .toString()
                            .substring(0, 10)),
                        title: snapshot.data![index].name,
                      );
                    } else {
                      return (const SizedBox());
                    }
                  });
            } else {
              return Center(
                  child:
                      Lottie.asset(loadingAnimation, height: 200, width: 200));
            }
          },
        ),
      ),
    );
  }
}

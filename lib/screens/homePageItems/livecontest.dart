import 'package:contestalert/constants.dart';
import 'package:contestalert/screens/widgets/listcontainer.dart';
import 'package:contestalert/services/api_manager.dart';
import 'package:flutter/material.dart';

class LiveContest extends StatefulWidget {
  const LiveContest({Key? key}) : super(key: key);

  @override
  _LiveContestState createState() => _LiveContestState();
}

class _LiveContestState extends State<LiveContest> {
  late Future<List> futurelist;

  @override
  void initState() {
    futurelist = APIManager().getDataAsList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        futurelist = APIManager().getDataAsList();
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
                      duration: 15.35,
                      title: snapshot.data![index].name,
                    );
                  } else {
                    return (const SizedBox());
                  }
                });
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

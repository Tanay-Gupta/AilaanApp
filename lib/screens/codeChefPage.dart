import 'package:contestalert/models/contestData.dart';
import 'package:contestalert/screens/homepage.dart';
import 'package:contestalert/screens/widgets/listcontainer.dart';
import 'package:contestalert/services/api_manager.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CodechefPage extends StatefulWidget {
  const CodechefPage({Key? key}) : super(key: key);

  @override
  _CodechefPageState createState() => _CodechefPageState();
}

class _CodechefPageState extends State<CodechefPage> {
  late Future<List> futurelist;

  @override
  void initState() {
    futurelist = APIManager().getDataAsList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int running = 0;
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.only(left: 20, top: 10, right: 20),
          child: Container(
              color: Colors.white,
              child: RefreshIndicator(
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

                            String imgurl = snapshot.data![index].site;

                            return ListContainer(
                              imgUrl: pictureId[imgurl].toString(),
                              number: (index + 1) < 10
                                  ? '0' + (index + 1).toString()
                                  : (index + 1).toString(),
                              duration: 15.35,
                              title: snapshot.data![index].name,
                            );
                          });
                    } else {
                      return Center(child: const CircularProgressIndicator());
                    }
                  },
                ),
              )),
        ));
  }
}

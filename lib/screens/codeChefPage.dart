import 'package:contestalert/models/contestData.dart';
import 'package:contestalert/services/api_manager.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: FutureBuilder<List>(
              future: futurelist,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        // FOR RUNNING CONTEST USE 'CODING'
                        // 'BEFORE' FOR UPCOMING CONTESTs
                        if (snapshot.data![index].status == 'BEFORE') {
                          return Container(
                            height: 100,
                            color: Colors.redAccent,
                            child: Row(
                              children: [Text(snapshot.data![index].name)],
                            ),
                          );
                        } else {
                          return (const SizedBox());
                        }
                      });
                } else {
                  return Center(child: const CircularProgressIndicator());
                }
              },
            )));
  }
}

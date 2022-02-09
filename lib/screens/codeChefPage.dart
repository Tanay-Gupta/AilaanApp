import 'package:contestalert/models/contestData.dart';
import 'package:contestalert/services/api_manager.dart';
import 'package:flutter/material.dart';

class CodechefPage extends StatefulWidget {
  const CodechefPage({Key? key}) : super(key: key);

  @override
  _CodechefPageState createState() => _CodechefPageState();
}

class _CodechefPageState extends State<CodechefPage> {
  List _codechefModel = [];

  @override
  void initState() {
    receivingData();
    super.initState();
  }

  void receivingData() async {
    _codechefModel = await APIManager().getDataAsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: ListView.builder(
                itemCount: _codechefModel.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    color: Colors.redAccent,
                    child: Row(
                      children: [Text(_codechefModel[index].name)],
                    ),
                  );
                })));
  }
}

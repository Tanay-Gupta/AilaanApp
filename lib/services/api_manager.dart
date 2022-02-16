import 'package:contestalert/models/allcontestData.dart';
import 'package:contestalert/models/contestData.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class APIManager {
  final bool allContest;
  final String contestUrl;

  String dateSub(String utc) {
    utc = utc.substring(0, 10) + "T" + utc.substring(11, 19) + ".000Z";

    var strToDateTime = DateTime.parse(utc);
    final convertLocal = strToDateTime.toLocal();
    return (convertLocal.toString());
  }

  APIManager(this.allContest, this.contestUrl);
  Future<List> getDataAsList() async {
    var client = http.Client();

    List contestDataAsList = [];

    try {
      var response = await client.get(Uri.parse(contestUrl));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        if (allContest == true) {
          contestDataAsList =
              jsonMap.map((model) => AllContestData.fromJson(model)).toList();
        } else {
          contestDataAsList =
              jsonMap.map((model) => ContestData.fromJson(model)).toList();
        }

        //print(contestDataAsList[0].endTime);
        contestDataAsList.sort((a, b) {
          return dateSub(a.startTime).compareTo(dateSub(b.startTime));
        });

        return contestDataAsList;
      }
    } catch (e) {
      //print(e.toString());
    }

    return contestDataAsList;
  }
}

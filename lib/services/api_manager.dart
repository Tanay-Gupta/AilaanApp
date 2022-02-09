import 'package:contestalert/constants.dart';
import 'package:contestalert/models/contestData.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class APIManager {
  Future<List> getDataAsList() async {
    var client = http.Client();

    List contestDataAsList = [];

    try {
      var response = await client.get(Uri.parse(codeChefUrl));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        contestDataAsList =
            jsonMap.map((model) => ContestData.fromJson(model)).toList();
        return contestDataAsList;
      }
    } catch (Exception) {
      print(Exception.toString());
    }

    return contestDataAsList;
  }
}

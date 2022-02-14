// To parse this JSON data, do
//
//     final contestData = contestDataFromJson(jsonString);

import 'dart:convert';

List<ContestData> contestDataFromJson(String str) => List<ContestData>.from(
    json.decode(str).map((x) => ContestData.fromJson(x)));

String contestDataToJson(List<ContestData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContestData {
  ContestData({
    this.name,
    this.url,
    this.startTime,
    this.endTime,
    this.duration,
    this.in24Hours,
    this.status,
  });

  String? name;
  String? url;
  String? startTime;
  String? endTime;
  String? duration;

  String? in24Hours;
  String? status;

  factory ContestData.fromJson(Map<String, dynamic> json) => ContestData(
        name: json["name"],
        url: json["url"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        duration: json["duration"],
        // type: json["type_"],
        in24Hours: json["in_24_hours"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "start_time": startTime,
        "end_time": endTime,
        "duration": duration,
        // "type_": type,
        "in_24_hours": in24Hours,
        "status": status,
      };
}

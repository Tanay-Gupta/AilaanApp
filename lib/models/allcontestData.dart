// To parse this JSON data, do
//
//     final allContestData = allContestDataFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<AllContestData> allContestDataFromJson(String str) =>
    List<AllContestData>.from(
        json.decode(str).map((x) => AllContestData.fromJson(x)));

String allContestDataToJson(List<AllContestData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllContestData {
  AllContestData({
    this.name,
    this.url,
    this.startTime,
    this.endTime,
    this.duration,
    this.site,
    this.in24Hours,
    this.status,
  });

  String? name;
  String? url;
  String? startTime;
  String? endTime;
  String? duration;
  String? site;
  String? in24Hours;
  String? status;

  factory AllContestData.fromJson(Map<String, dynamic> json) => AllContestData(
        name: json["name"],
        url: json["url"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        duration: json["duration"],
        site: json["site"],
        in24Hours: json["in_24_hours"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "start_time": startTime,
        "end_time": endTime,
        "duration": duration,
        "site": site,
        "in_24_hours": in24Hours,
        "status": status,
      };
}

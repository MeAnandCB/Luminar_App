// To parse this JSON data, do
//
//     final overviewScreenModel = overviewScreenModelFromJson(jsonString);

import 'dart:convert';

OverviewScreenModel overviewScreenModelFromJson(String str) =>
    OverviewScreenModel.fromJson(json.decode(str));

String overviewScreenModelToJson(OverviewScreenModel data) =>
    json.encode(data.toJson());

class OverviewScreenModel {
  String id;
  DateTime startDate;
  String batchCode;
  String courseName;
  List<String> subjects;

  OverviewScreenModel({
    required this.id,
    required this.startDate,
    required this.batchCode,
    required this.courseName,
    required this.subjects,
  });

  factory OverviewScreenModel.fromJson(Map<String, dynamic> json) =>
      OverviewScreenModel(
        id: json["id"],
        startDate: DateTime.parse(json["start_date"]),
        batchCode: json["batch_code"],
        courseName: json["course_name"],
        subjects: List<String>.from(json["subjects"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "batch_code": batchCode,
        "course_name": courseName,
        "subjects": List<dynamic>.from(subjects.map((x) => x)),
      };
}

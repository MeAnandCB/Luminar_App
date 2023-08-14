// To parse this JSON data, do
//
//     final attendenceScreenModel = attendenceScreenModelFromJson(jsonString);

import 'dart:convert';

AttendenceScreenModel attendenceScreenModelFromJson(String str) =>
    AttendenceScreenModel.fromJson(json.decode(str));

String attendenceScreenModelToJson(AttendenceScreenModel data) =>
    json.encode(data.toJson());

class AttendenceScreenModel {
  String? status;
  AttendanceRecord? attendanceRecord;

  AttendenceScreenModel({
    this.status,
    this.attendanceRecord,
  });

  factory AttendenceScreenModel.fromJson(Map<String, dynamic> json) =>
      AttendenceScreenModel(
        status: json["status"],
        attendanceRecord: json["attendance_record"] == null
            ? null
            : AttendanceRecord.fromJson(json["attendance_record"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "attendance_record": attendanceRecord?.toJson(),
      };
}

class AttendanceRecord {
  String? id;
  String? batchName;
  int? classAttended;
  int? totalClasses;

  AttendanceRecord({
    this.id,
    this.batchName,
    this.classAttended,
    this.totalClasses,
  });

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) =>
      AttendanceRecord(
        id: json["id"],
        batchName: json["batch_name"],
        classAttended: json["class_attended"],
        totalClasses: json["total_classes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "batch_name": batchName,
        "class_attended": classAttended,
        "total_classes": totalClasses,
      };
}

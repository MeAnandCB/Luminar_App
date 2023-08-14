// import 'dart:convert';

// CourseDetailsResModel courseDetailsResModelFromJson(String str) =>
//     CourseDetailsResModel.fromJson(json.decode(str));

// String courseDetailsResModelToJson(CourseDetailsResModel data) =>
//     json.encode(data.toJson());

// class CourseDetailsResModel {
//   String? id;
//   String? title;
//   String? thumbnail;
//   String? description;
//   String? fullName;
//   String? cochin;
//   String? calicut;
//   String? duration;
//   String? offlineFees;
//   String? onlineFees;
//   List<Module>? modules;

//   CourseDetailsResModel({
//     this.id,
//     this.title,
//     this.thumbnail,
//     this.description,
//     this.fullName,
//     this.cochin,
//     this.calicut,
//     this.duration,
//     this.offlineFees,
//     this.onlineFees,
//     this.modules,
//   });

//   factory CourseDetailsResModel.fromJson(Map<String, dynamic> json) =>
//       CourseDetailsResModel(
//         id: json["id"],
//         title: json["title"],
//         thumbnail: json["thumbnail"],
//         description: json["description"],
//         fullName: json["full_name"],
//         cochin: json["cochin"],
//         calicut: json["calicut"],
//         duration: json["duration"],
//         offlineFees: json["offline_fees"],
//         onlineFees: json["online_fees"],
//         modules: json["modules"] == null
//             ? []
//             : List<Module>.from(
//                 json["modules"]!.map((x) => Module.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "thumbnail": thumbnail,
//         "description": description,
//         "full_name": fullName,
//         "cochin": cochin,
//         "calicut": calicut,
//         "duration": duration,
//         "offline_fees": offlineFees,
//         "online_fees": onlineFees,
//         "modules": modules == null
//             ? []
//             : List<dynamic>.from(modules!.map((x) => x.toJson())),
//       };
// }

// class Module {
//   String? moduleNo;
//   String? moduleHeading;
//   String? moduleText;

//   Module({
//     this.moduleNo,
//     this.moduleHeading,
//     this.moduleText,
//   });

//   factory Module.fromJson(Map<String, dynamic> json) => Module(
//         moduleNo: json["module_no"],
//         moduleHeading: json["module_heading"],
//         moduleText: json["module_text"],
//       );

//   Map<String, dynamic> toJson() => {
//         "module_no": moduleNo,
//         "module_heading": moduleHeading,
//         "module_text": moduleText,
//       };
// }

// To parse this JSON data, do
//
//     final courseDetailsModel = courseDetailsModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final courseDetailsResModel = courseDetailsResModelFromJson(jsonString);

import 'dart:convert';

CourseDetailsResModel courseDetailsResModelFromJson(String str) =>
    CourseDetailsResModel.fromJson(json.decode(str));

String courseDetailsResModelToJson(CourseDetailsResModel data) =>
    json.encode(data.toJson());

class CourseDetailsResModel {
  String status;
  List<CourseDetailData> courseDetailList;
  int totalResults;

  CourseDetailsResModel({
    required this.status,
    required this.courseDetailList,
    required this.totalResults,
  });

  factory CourseDetailsResModel.fromJson(Map<String, dynamic> json) =>
      CourseDetailsResModel(
        status: json["status"],
        courseDetailList: List<CourseDetailData>.from(
            json["data"].map((x) => CourseDetailData.fromJson(x))),
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(courseDetailList.map((x) => x.toJson())),
        "totalResults": totalResults,
      };
}

class CourseDetailData {
  int id;
  String title;
  String description;
  String duration;
  String offlineFees;
  String onlineFees;
  String thumbnail;
  String fullName;
  String cochin;
  String calicut;
  List<Module> modules;

  CourseDetailData({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.offlineFees,
    required this.onlineFees,
    required this.thumbnail,
    required this.fullName,
    required this.cochin,
    required this.calicut,
    required this.modules,
  });

  factory CourseDetailData.fromJson(Map<String, dynamic> json) =>
      CourseDetailData(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        duration: json["duration"],
        offlineFees: json["offline_fees"],
        onlineFees: json["online_fees"],
        thumbnail: json["thumbnail"],
        fullName: json["full_name"],
        cochin: json["cochin"],
        calicut: json["calicut"],
        modules:
            List<Module>.from(json["modules"].map((x) => Module.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "duration": duration,
        "offline_fees": offlineFees,
        "online_fees": onlineFees,
        "thumbnail": thumbnail,
        "full_name": fullName,
        "cochin": cochin,
        "calicut": calicut,
        "modules": List<dynamic>.from(modules.map((x) => x.toJson())),
      };
}

class Module {
  int id;
  int modNo;
  String modHeading;
  String modDescription;
  int name;

  Module({
    required this.id,
    required this.modNo,
    required this.modHeading,
    required this.modDescription,
    required this.name,
  });

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        id: json["id"],
        modNo: json["mod_no"],
        modHeading: json["mod_heading"],
        modDescription: json["mod_description"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mod_no": modNo,
        "mod_heading": modHeading,
        "mod_description": modDescription,
        "name": name,
      };
}

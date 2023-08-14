// import 'dart:convert';

// CourseListModel courseListModelFromJson(String str) =>
//     CourseListModel.fromJson(json.decode(str));

// String courseListModelToJson(CourseListModel data) =>
//     json.encode(data.toJson());

// class CourseListModel {
//   String status;
//   List<Course> courses;
//   int totalResults;

//   CourseListModel({
//     required this.status,
//     required this.courses,
//     required this.totalResults,
//   });

//   factory CourseListModel.fromJson(Map<String, dynamic> json) =>
//       CourseListModel(
//         status: json["status"],
//         courses: List<Course>.from(json["data"].map((x) => Course.fromJson(x))),
//         totalResults: json["totalResults"],
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": List<dynamic>.from(courses.map((x) => x.toJson())),
//         "totalResults": totalResults,
//       };
// }

// class Course {
//   String id;
//   String name;
//   String image;

//   Course({
//     required this.id,
//     required this.name,
//     required this.image,
//   });

//   factory Course.fromJson(Map<String, dynamic> json) => Course(
//         id: json["id"],
//         name: json["name"],
//         image: json["image"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "image": image,
//       };
// }

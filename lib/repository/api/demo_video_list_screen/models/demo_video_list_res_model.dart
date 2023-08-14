// To parse this JSON data, do
//
//     final demoVideoListRestModel = demoVideoListRestModelFromJson(jsonString);

import 'dart:convert';

DemoVideoListRestModel demoVideoListRestModelFromJson(String str) =>
    DemoVideoListRestModel.fromJson(json.decode(str));

String demoVideoListRestModelToJson(DemoVideoListRestModel data) =>
    json.encode(data.toJson());

class DemoVideoListRestModel {
  int? id;
  String? title;
  String? thumbnail;
  List<DemoVideoResModel>? videos;

  DemoVideoListRestModel({
    this.id,
    this.title,
    this.thumbnail,
    this.videos,
  });

  factory DemoVideoListRestModel.fromJson(Map<String, dynamic> json) =>
      DemoVideoListRestModel(
        id: json["id"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        videos: json["videos"] == null
            ? []
            : List<DemoVideoResModel>.from(
                json["videos"]!.map((x) => DemoVideoResModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "thumbnail": thumbnail,
        "videos": videos == null
            ? []
            : List<dynamic>.from(videos!.map((x) => x.toJson())),
      };
}

class DemoVideoResModel {
  int? id;
  String? description;
  String? videoLink;
  String? uploadedDate;
  String? name;

  DemoVideoResModel({
    this.id,
    this.description,
    this.videoLink,
    this.uploadedDate,
    this.name,
  });

  factory DemoVideoResModel.fromJson(Map<String, dynamic> json) =>
      DemoVideoResModel(
        id: json["id"],
        description: json["description"],
        videoLink: json["video_link"],
        uploadedDate: json["uploaded_date"],
        name: json["name"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "video_link": videoLink,
        "uploaded_date": uploadedDate,
        "name": name,
      };
}

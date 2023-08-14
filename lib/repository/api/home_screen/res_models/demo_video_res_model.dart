import 'dart:convert';

DemoVideoResModel demoVideoResModelFromJson(String str) =>
    DemoVideoResModel.fromJson(json.decode(str));

String demoVideoResModelToJson(DemoVideoResModel data) =>
    json.encode(data.toJson());

class DemoVideoResModel {
  String? status;
  List<DemoVideoCourseData>? demoVideoCourseList;
  int? totalResults;

  DemoVideoResModel({
    this.status,
    this.demoVideoCourseList,
    this.totalResults,
  });

  factory DemoVideoResModel.fromJson(Map<String, dynamic> json) =>
      DemoVideoResModel(
        status: json["status"],
        demoVideoCourseList: json["data"] == null
            ? []
            : List<DemoVideoCourseData>.from(
                json["data"]!.map((x) => DemoVideoCourseData.fromJson(x))),
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": demoVideoCourseList == null
            ? []
            : List<dynamic>.from(demoVideoCourseList!.map((x) => x.toJson())),
        "totalResults": totalResults,
      };
}

class DemoVideoCourseData {
  int? id;
  String? title;
  String? thumbnail;
  List<DemoVideoDataModel>? videos;

  DemoVideoCourseData({
    this.id,
    this.title,
    this.thumbnail,
    this.videos,
  });

  factory DemoVideoCourseData.fromJson(Map<String, dynamic> json) =>
      DemoVideoCourseData(
        id: json["id"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        videos: json["videos"] == null
            ? []
            : List<DemoVideoDataModel>.from(
                json["videos"]!.map((x) => DemoVideoDataModel.fromJson(x))),
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

class DemoVideoDataModel {
  int? id;
  String? description;
  String? videoLink;
  String? uploadedDate;
  int? name;

  DemoVideoDataModel({
    this.id,
    this.description,
    this.videoLink,
    this.uploadedDate,
    this.name,
  });

  factory DemoVideoDataModel.fromJson(Map<String, dynamic> json) =>
      DemoVideoDataModel(
        id: json["id"],
        description: json["description"],
        videoLink: json["video_link"],
        uploadedDate: json["uploaded_date"]!,
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "video_link": videoLink,
        "uploaded_date": uploadedDate,
        "name": name,
      };
}

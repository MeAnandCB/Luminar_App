// To parse this JSON data, do
//
//     final batchScreenModel = batchScreenModelFromJson(jsonString);

import 'dart:convert';

BatchScreenModel batchScreenModelFromJson(String str) =>
    BatchScreenModel.fromJson(json.decode(str));

String batchScreenModelToJson(BatchScreenModel data) =>
    json.encode(data.toJson());

class BatchScreenModel {
  String status;
  List<BatchDetails> data;
  int totalResults;

  BatchScreenModel({
    required this.status,
    required this.data,
    required this.totalResults,
  });

  factory BatchScreenModel.fromJson(Map<String, dynamic> json) =>
      BatchScreenModel(
        status: json["status"],
        data: List<BatchDetails>.from(
            json["data"].map((x) => BatchDetails.fromJson(x))),
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "totalResults": totalResults,
      };
}

class BatchDetails {
  String id;
  String name;
  String description;
  bool offline;

  BatchDetails({
    required this.id,
    required this.name,
    required this.description,
    required this.offline,
  });

  factory BatchDetails.fromJson(Map<String, dynamic> json) => BatchDetails(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        offline: json["offline"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "offline": offline,
      };
}

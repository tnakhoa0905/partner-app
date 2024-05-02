// To parse this JSON data, do
//
//     final permanentModel = permanentModelFromJson(jsonString);

import 'dart:convert';

import 'package:partner_app/data/model/taker_model.dart';

PermanentModel permanentModelFromJson(String str) =>
    PermanentModel.fromJson(json.decode(str));

String permanentModelToJson(PermanentModel data) => json.encode(data.toJson());

class PermanentModel {
  List<DateTime>? date;
  String? id;
  String? userId;
  String? companyId;
  TaskId? taskId;
  int? status;
  int? price;
  int? time;
  bool? isPaid;
  int? permanentModelId;
  int? v;
  int? package;
  TaskerId? taskerId;
  PermanentModel({
    this.date,
    this.id,
    this.userId,
    this.companyId,
    this.taskId,
    this.status,
    this.price,
    this.package,
    this.time,
    this.isPaid,
    this.permanentModelId,
    this.v,
    this.taskerId,
  });
  PermanentModel copyWith({
    List<DateTime>? date,
    String? id,
    String? userId,
    String? companyId,
    TaskId? taskId,
    int? status,
    int? price,
    int? time,
    bool? isPaid,
    int? permanentModelId,
    int? v,
    int? package,
    TaskerId? taskerId,
  }) =>
      PermanentModel(
        date: date ?? this.date,
        id: id ?? this.id,
        userId: userId ?? this.userId,
        companyId: companyId ?? this.companyId,
        taskId: taskId ?? this.taskId,
        status: status ?? this.status,
        price: price ?? this.price,
        time: time ?? this.time,
        package: package ?? this.package,
        isPaid: isPaid ?? this.isPaid,
        permanentModelId: permanentModelId ?? this.permanentModelId,
        v: v ?? this.v,
        taskerId: taskerId ?? this.taskerId,
      );
  factory PermanentModel.fromJson(Map<String, dynamic> json) => PermanentModel(
        date: json["date"] == null
            ? []
            : List<DateTime>.from(json["date"]!.map((x) => DateTime.parse(x))),
        id: json["_id"],
        userId: json["userId"],
        companyId: json["companyId"],
        taskId: json["taskId"] == null ? null : TaskId.fromJson(json["taskId"]),
        status: json["status"],
        price: json["price"],
        time: json["time"],
        package: json["package"],
        isPaid: json["isPaid"],
        permanentModelId: json["id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "date": date == null
            ? []
            : List<dynamic>.from(date!.map((x) => x.toIso8601String())),
        "_id": id,
        "userId": userId,
        "companyId": companyId,
        "taskId": taskId?.toJson(),
        "status": status,
        "price": price,
        "time": time,
        "isPaid": isPaid,
        "package": package,
        "id": permanentModelId,
        "__v": v,
      };
}

class TaskId {
  List<int>? option;
  String? id;
  String? userId;
  String? name;
  int? typeOfHouse;
  String? address;
  int? estimateTime;
  String? note;
  int? price;
  int? taskIdId;
  int? v;

  TaskId({
    this.option,
    this.id,
    this.userId,
    this.name,
    this.typeOfHouse,
    this.address,
    this.estimateTime,
    this.note,
    this.price,
    this.taskIdId,
    this.v,
  });

  factory TaskId.fromJson(Map<String, dynamic> json) => TaskId(
        option: json["option"] == null
            ? []
            : List<int>.from(json["option"]!.map((x) => x)),
        id: json["_id"],
        userId: json["userId"],
        name: json["name"],
        typeOfHouse: json["typeOfHouse"],
        address: json["address"],
        estimateTime: json["estimateTime"],
        note: json["note"],
        price: json["price"],
        taskIdId: json["id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "option":
            option == null ? [] : List<dynamic>.from(option!.map((x) => x)),
        "_id": id,
        "userId": userId,
        "name": name,
        "typeOfHouse": typeOfHouse,
        "address": address,
        "estimateTime": estimateTime,
        "note": note,
        "price": price,
        "id": taskIdId,
        "__v": v,
      };
}

// To parse this JSON data, do
//
//     final createParmenentModel = createParmenentModelFromJson(jsonString);

class CreateParmanentModel {
  String? userId;
  String? name;
  int? typeOfHouse;
  String? address;
  int? estimateTime;
  String? note;
  List<int>? option;
  int? price;
  int? time;
  List<DateTime>? date;
  int? package;

  CreateParmanentModel({
    this.userId,
    this.name,
    this.typeOfHouse,
    this.address,
    this.estimateTime,
    this.note,
    this.option,
    this.price,
    this.time,
    this.date,
    this.package,
  });
  CreateParmanentModel createParmenentModelFromJson(String str) =>
      CreateParmanentModel.fromJson(json.decode(str));

  String createParmenentModelToJson(CreateParmanentModel data) =>
      json.encode(data.toJson());

  factory CreateParmanentModel.fromJson(Map<String, dynamic> json) =>
      CreateParmanentModel(
        userId: json["userId"],
        name: json["name"],
        typeOfHouse: json["typeOfHouse"],
        address: json["address"],
        estimateTime: json["estimateTime"],
        note: json["note"],
        option: json["option"] == null
            ? []
            : List<int>.from(json["option"]!.map((x) => x)),
        price: json["price"],
        time: json["time"],
        date: json["date"] == null
            ? []
            : List<DateTime>.from(json["date"]!.map((x) => DateTime.parse(x))),
        package: json["package"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "typeOfHouse": typeOfHouse,
        "address": address,
        "estimateTime": estimateTime,
        "note": note,
        "option":
            option == null ? [] : List<dynamic>.from(option!.map((x) => x)),
        "price": price,
        "time": time,
        "date": date == null
            ? []
            : List<dynamic>.from(date!.map((x) => x.toIso8601String())),
        "package": package,
      };
}

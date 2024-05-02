// To parse this JSON data, do
//
//     final taskBookingModel = taskBookingModelFromJson(jsonString);

import 'dart:convert';

import 'package:partner_app/data/model/taker_model.dart';

TaskBookingModel taskBookingModelFromJson(String str) =>
    TaskBookingModel.fromJson(json.decode(str));

String taskBookingModelToJson(TaskBookingModel data) =>
    json.encode(data.toJson());

class TaskBookingModel {
  List<dynamic>? remind;
  String? id;
  String? userId;
  String? companyId;
  TaskId? taskId;
  int? status;
  int? price;
  int? time;
  DateTime? date;
  bool? isPaid;
  int? taskBookingModelId;
  int? v;
  TaskerId? taskerId;

  TaskBookingModel({
    this.remind,
    this.id,
    this.userId,
    this.companyId,
    this.taskId,
    this.status,
    this.price,
    this.time,
    this.date,
    this.isPaid,
    this.taskBookingModelId,
    this.v,
    this.taskerId,
  });
  TaskBookingModel copyWith({
    required List<dynamic> remind,
    required String id,
    required String userId,
    String? companyId,
    required TaskId taskId,
    required int status,
    required int price,
    required int time,
    required DateTime date,
    required bool isPaid,
    required int taskBookingModelId,
    required int v,
    TaskerId? taskerId,
  }) =>
      TaskBookingModel(
        remind: remind,
        id: id,
        userId: userId,
        companyId: companyId,
        taskId: taskId,
        status: status,
        price: price,
        time: time,
        date: date,
        isPaid: isPaid,
        taskBookingModelId: taskBookingModelId,
        v: v,
        taskerId: taskerId ?? this.taskerId,
      );
  factory TaskBookingModel.fromJson(Map<String, dynamic> json) =>
      TaskBookingModel(
        remind: json["remind"] == null
            ? []
            : List<dynamic>.from(json["remind"]!.map((x) => x)),
        id: json["_id"],
        userId: json["userId"],
        companyId: json["companyId"],
        taskId: json["taskId"] == null ? null : TaskId.fromJson(json["taskId"]),
        status: json["status"],
        price: json["price"],
        time: json["time"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        isPaid: json["isPaid"],
        taskBookingModelId: json["id"],
        v: json["__v"],
        taskerId: json["taskerId"] == null
            ? null
            : TaskerId.fromJson(json["taskerId"]),
      );

  Map<String, dynamic> toJson() => {
        "remind":
            remind == null ? [] : List<dynamic>.from(remind!.map((x) => x)),
        "_id": id,
        "userId": userId,
        "companyId": companyId,
        "taskId": taskId?.toJson(),
        "status": status,
        "price": price,
        "time": time,
        "date": date?.toIso8601String(),
        "isPaid": isPaid,
        "id": taskBookingModelId,
        "__v": v,
        "taskerId": taskerId?.toJson(),
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

class CreateTaskModel {
  String? userId;
  int? typeOfHouse;
  String? name;
  String? address;
  int? estimateTime;
  String? note;
  List<int>? option;
  int? price;
  int? time;
  DateTime? date;

  CreateTaskModel({
    this.userId,
    this.typeOfHouse,
    this.name,
    this.address,
    this.estimateTime,
    this.note,
    this.option,
    this.price,
    this.time,
    this.date,
  });
  CreateTaskModel createTaskModelFromJson(String str) =>
      CreateTaskModel.fromJson(json.decode(str));

  String createTaskModelToJson(CreateTaskModel data) =>
      json.encode(data.toJson());

  factory CreateTaskModel.fromJson(Map<String, dynamic> json) =>
      CreateTaskModel(
        userId: json["userId"],
        typeOfHouse: json["typeOfHouse"],
        name: json["name"],
        address: json["address"],
        estimateTime: json["estimateTime"],
        note: json["note"],
        option: json["option"] == null
            ? []
            : List<int>.from(json["option"]!.map((x) => x)),
        price: json["price"],
        time: json["time"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "typeOfHouse": typeOfHouse,
        "name": name,
        "address": address,
        "estimateTime": estimateTime,
        "note": note,
        "option":
            option == null ? [] : List<dynamic>.from(option!.map((x) => x)),
        "price": price,
        "time": time,
        "date": date?.toIso8601String(),
      };
}

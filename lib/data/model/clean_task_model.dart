import 'dart:convert';

import 'package:partner_app/data/model/taker_model.dart';

class CreateCleanModel {
  String? userId;
  String? name;
  int? typeOfHouse;
  String? address;
  int? estimateTime;
  int? estimatePeople;
  int? estimateS;
  String? note;
  int? price;
  int? time;
  DateTime? date;

  CreateCleanModel({
    this.userId,
    this.name,
    this.typeOfHouse,
    this.address,
    this.estimateTime,
    this.estimatePeople,
    this.estimateS,
    this.note,
    this.price,
    this.time,
    this.date,
  });

  CreateCleanModel createCleanModelFromJson(String str) =>
      CreateCleanModel.fromJson(json.decode(str));

  String createCleanModelToJson(CreateCleanModel data) =>
      json.encode(data.toJson());
  factory CreateCleanModel.fromJson(Map<String, dynamic> json) =>
      CreateCleanModel(
        userId:
            json["userId"] is String ? json["userId"] : json["userId"]["id"],
        name: json["name"],
        typeOfHouse: json["typeOfHouse"],
        address: json["address"],
        estimateTime: json["estimateTime"],
        estimatePeople: json["estimatePeople"],
        estimateS: json["estimateS"],
        note: json["note"],
        price: json["price"],
        time: json["time"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "typeOfHouse": typeOfHouse,
        "address": address,
        "estimateTime": estimateTime,
        "estimatePeople": estimatePeople,
        "estimateS": estimateS,
        "note": note,
        "price": price,
        "time": time,
        "date": date?.toIso8601String(),
      };
}

// To parse this JSON data, do
//
//     final createCleanModel = createCleanModelFromJson(jsonString);

CreateCleanModel createCleanModelFromJson(String str) =>
    CreateCleanModel.fromJson(json.decode(str));

String createCleanModelToJson(CreateCleanModel data) =>
    json.encode(data.toJson());

class CleanModel {
  TaskerId? taskerId;
  String? id;
  String? userId;
  CleanId? cleanId;
  int? status;
  String? companyId;
  int? price;
  int? time;
  DateTime? date;
  bool? isPaid;
  int? cleanModelId;
  int? type;
  int? v;

  CleanModel(
      {this.taskerId,
      this.id,
      this.userId,
      this.cleanId,
      this.status,
      this.companyId,
      this.price,
      this.time,
      this.date,
      this.isPaid,
      this.cleanModelId,
      this.v,
      this.type = 1});
  CleanModel copyWith({
    TaskerId? taskerId,
    String? id,
    String? userId,
    CleanId? cleanId,
    int? status,
    String? companyId,
    int? price,
    int? time,
    DateTime? date,
    bool? isPaid,
    int? cleanModelId,
    int? v,
    int? type,
  }) =>
      CleanModel(
          taskerId: taskerId ?? this.taskerId,
          id: id ?? this.id,
          userId: userId ?? this.userId,
          cleanId: cleanId ?? this.cleanId,
          status: status ?? this.status,
          companyId: companyId ?? this.companyId,
          price: price ?? this.price,
          time: time ?? this.time,
          date: date ?? this.date,
          isPaid: isPaid ?? this.isPaid,
          cleanModelId: cleanModelId ?? this.cleanModelId,
          v: v ?? this.v,
          type: type ?? 1);

  factory CleanModel.fromJson(Map<String, dynamic> json) => CleanModel(
      taskerId:
          json["taskerId"] == null ? null : TaskerId.fromJson(json["taskerId"]),
      id: json["_id"],
      userId: json["userId"] is String ? json["userId"] : json["userId"]["_id"],
      cleanId:
          json["cleanId"] == null ? null : CleanId.fromJson(json["cleanId"]),
      status: json["status"],
      companyId: json["companyId"],
      price: json["price"],
      time: json["time"],
      date: json["date"] == null ? null : DateTime.parse(json["date"]),
      isPaid: json["isPaid"],
      cleanModelId: json["id"],
      v: json["__v"],
      type: json["type"] ?? 1);

  Map<String, dynamic> toJson() => {
        "taskerId": taskerId?.toJson(),
        "_id": id,
        "userId": userId,
        "cleanId": cleanId?.toJson(),
        "status": status,
        "companyId": companyId,
        "price": price,
        "time": time,
        "date": date?.toIso8601String(),
        "isPaid": isPaid,
        "id": cleanModelId,
        "__v": v,
        "type": type
      };
}

class CleanId {
  List<dynamic>? option;
  String? id;
  String? userId;
  String? name;
  int? typeOfHouse;
  String? address;
  int? estimateTime;
  int? estimatePeople;
  int? estimateS;
  String? note;
  int? price;
  int? cleanIdId;
  int? v;

  CleanId({
    this.option,
    this.id,
    this.userId,
    this.name,
    this.typeOfHouse,
    this.address,
    this.estimateTime,
    this.estimatePeople,
    this.estimateS,
    this.note,
    this.price,
    this.cleanIdId,
    this.v,
  });

  factory CleanId.fromJson(Map<String, dynamic> json) => CleanId(
        option: json["option"] == null
            ? []
            : List<dynamic>.from(json["option"]!.map((x) => x)),
        id: json["_id"],
        userId: json["userId"],
        name: json["name"],
        typeOfHouse: json["typeOfHouse"],
        address: json["address"],
        estimateTime: json["estimateTime"],
        estimatePeople: json["estimatePeople"],
        estimateS: json["estimateS"],
        note: json["note"],
        price: json["price"],
        cleanIdId: json["id"],
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
        "estimatePeople": estimatePeople,
        "estimateS": estimateS,
        "note": note,
        "price": price,
        "id": cleanIdId,
        "__v": v,
      };
}

class UserId {
  String? id;
  String? fullName;
  String? phoneNumber;

  UserId({
    this.id,
    this.fullName,
    this.phoneNumber,
  });

  UserId copyWith({
    String? id,
    String? fullName,
    String? phoneNumber,
  }) =>
      UserId(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
      };
}

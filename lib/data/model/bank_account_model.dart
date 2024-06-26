// To parse this JSON data, do
//
//     final bankAccountModel = bankAccountModelFromJson(jsonString);

import 'dart:convert';

BankAccountModel bankAccountModelFromJson(String str) =>
    BankAccountModel.fromJson(json.decode(str));

String bankAccountModelToJson(BankAccountModel data) =>
    json.encode(data.toJson());

class BankAccountModel {
  String? id;
  String? userId;
  String? bankAccountNumber;
  String? bankAccountName;
  String? userAccountName;
  int? v;

  BankAccountModel({
    this.id,
    this.userId,
    this.bankAccountNumber,
    this.bankAccountName,
    this.userAccountName,
    this.v,
  });

  BankAccountModel copyWith({
    String? id,
    String? userId,
    String? bankAccountNumber,
    String? bankAccountName,
    String? userAccountName,
    int? v,
  }) =>
      BankAccountModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
        bankAccountName: bankAccountName ?? this.bankAccountName,
        userAccountName: userAccountName ?? this.userAccountName,
        v: v ?? this.v,
      );

  factory BankAccountModel.fromJson(Map<String, dynamic> json) =>
      BankAccountModel(
        id: json["_id"],
        userId: json["userId"],
        bankAccountNumber: json["bankAccountNumber"],
        bankAccountName: json["bankAccountName"],
        userAccountName: json["userAccountName"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "bankAccountNumber": bankAccountNumber,
        "bankAccountName": bankAccountName,
        "userAccountName": userAccountName,
        "__v": v,
      };
}

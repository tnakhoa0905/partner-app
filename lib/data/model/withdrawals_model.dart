// To parse this JSON data, do
//
//     final withdrawalsModel = withdrawalsModelFromJson(jsonString);

import 'dart:convert';

WithdrawalsModel withdrawalsModelFromJson(String str) =>
    WithdrawalsModel.fromJson(json.decode(str));

String withdrawalsModelToJson(WithdrawalsModel data) =>
    json.encode(data.toJson());

class WithdrawalsModel {
  int? status;
  String? id;
  String? userId;
  int? amount;
  String? accountNumber;
  String? bank;
  String? bankAccountName;
  DateTime? dateCreated;
  int? v;

  WithdrawalsModel({
    this.status,
    this.id,
    this.userId,
    this.amount,
    this.accountNumber,
    this.bank,
    this.bankAccountName,
    this.dateCreated,
    this.v,
  });

  WithdrawalsModel copyWith({
    int? status,
    String? id,
    String? userId,
    int? amount,
    String? accountNumber,
    String? bank,
    String? bankAccountName,
    DateTime? dateCreated,
    int? v,
  }) =>
      WithdrawalsModel(
        status: status ?? this.status,
        id: id ?? this.id,
        userId: userId ?? this.userId,
        amount: amount ?? this.amount,
        accountNumber: accountNumber ?? this.accountNumber,
        bank: bank ?? this.bank,
        bankAccountName: bankAccountName ?? this.bankAccountName,
        dateCreated: dateCreated ?? this.dateCreated,
        v: v ?? this.v,
      );

  factory WithdrawalsModel.fromJson(Map<String, dynamic> json) =>
      WithdrawalsModel(
        status: json["status"],
        id: json["_id"],
        userId: json["userId"],
        amount: json["amount"],
        accountNumber: json["accountNumber"],
        bank: json["bank"],
        bankAccountName: json["bankAccountName"],
        dateCreated: json["dateCreated"] == null
            ? null
            : DateTime.parse(json["dateCreated"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "_id": id,
        "userId": userId,
        "amount": amount,
        "accountNumber": accountNumber,
        "bank": bank,
        "bankAccountName": bankAccountName,
        "dateCreated": dateCreated?.toIso8601String(),
        "__v": v,
      };
}

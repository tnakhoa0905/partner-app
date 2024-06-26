// To parse this JSON data, do
//
//     final bankModel = bankModelFromJson(jsonString);

import 'dart:convert';

BankModel bankModelFromJson(String str) => BankModel.fromJson(json.decode(str));

String bankModelToJson(BankModel data) => json.encode(data.toJson());

class BankModel {
  int? id;
  String? name;
  String? code;
  String? bin;
  String? shortName;
  String? logo;
  int? transferSupported;
  int? lookupSupported;
  String? bankModelShortName;
  int? support;
  int? isTransfer;
  String? swiftCode;

  BankModel({
    this.id,
    this.name,
    this.code,
    this.bin,
    this.shortName,
    this.logo,
    this.transferSupported,
    this.lookupSupported,
    this.bankModelShortName,
    this.support,
    this.isTransfer,
    this.swiftCode,
  });

  BankModel copyWith({
    int? id,
    String? name,
    String? code,
    String? bin,
    String? shortName,
    String? logo,
    int? transferSupported,
    int? lookupSupported,
    String? bankModelShortName,
    int? support,
    int? isTransfer,
    String? swiftCode,
  }) =>
      BankModel(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        bin: bin ?? this.bin,
        shortName: shortName ?? this.shortName,
        logo: logo ?? this.logo,
        transferSupported: transferSupported ?? this.transferSupported,
        lookupSupported: lookupSupported ?? this.lookupSupported,
        bankModelShortName: bankModelShortName ?? this.bankModelShortName,
        support: support ?? this.support,
        isTransfer: isTransfer ?? this.isTransfer,
        swiftCode: swiftCode ?? this.swiftCode,
      );

  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        bin: json["bin"],
        shortName: json["shortName"],
        logo: json["logo"],
        transferSupported: json["transferSupported"],
        lookupSupported: json["lookupSupported"],
        bankModelShortName: json["short_name"],
        support: json["support"],
        isTransfer: json["isTransfer"],
        swiftCode: json["swift_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "bin": bin,
        "shortName": shortName,
        "logo": logo,
        "transferSupported": transferSupported,
        "lookupSupported": lookupSupported,
        "short_name": bankModelShortName,
        "support": support,
        "isTransfer": isTransfer,
        "swift_code": swiftCode,
      };
}

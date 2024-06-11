// To parse this JSON data, do
//
//     final cleanRatingModel = cleanRatingModelFromJson(jsonString);

import 'dart:convert';

CleanRatingModel cleanRatingModelFromJson(String str) =>
    CleanRatingModel.fromJson(json.decode(str));

String cleanRatingModelToJson(CleanRatingModel data) =>
    json.encode(data.toJson());

class CleanRatingModel {
  CleanBookingReview? cleanBookingReview;
  String? id;
  String? userId;
  CleanBookingId? cleanBookingId;
  int? cleanBookingRating;
  int? v;

  CleanRatingModel({
    this.cleanBookingReview,
    this.id,
    this.userId,
    this.cleanBookingId,
    this.cleanBookingRating,
    this.v,
  });

  CleanRatingModel copyWith({
    CleanBookingReview? cleanBookingReview,
    String? id,
    String? userId,
    CleanBookingId? cleanBookingId,
    int? cleanBookingRating,
    int? v,
  }) =>
      CleanRatingModel(
        cleanBookingReview: cleanBookingReview ?? this.cleanBookingReview,
        id: id ?? this.id,
        userId: userId ?? this.userId,
        cleanBookingId: cleanBookingId ?? this.cleanBookingId,
        cleanBookingRating: cleanBookingRating ?? this.cleanBookingRating,
        v: v ?? this.v,
      );

  factory CleanRatingModel.fromJson(Map<String, dynamic> json) =>
      CleanRatingModel(
        cleanBookingReview: json["cleanBookingReview"] == null
            ? null
            : CleanBookingReview.fromJson(json["cleanBookingReview"]),
        id: json["_id"],
        userId: json["userId"],
        cleanBookingId: json["cleanBookingId"] == null
            ? null
            : CleanBookingId.fromJson(json["cleanBookingId"]),
        cleanBookingRating: json["cleanBookingRating"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "cleanBookingReview": cleanBookingReview?.toJson(),
        "_id": id,
        "userId": userId,
        "cleanBookingId": cleanBookingId?.toJson(),
        "cleanBookingRating": cleanBookingRating,
        "__v": v,
      };
}

class CleanBookingId {
  List<String>? taskerIdArr;
  int? paymentMethod;
  String? id;
  String? userId;
  String? cleanId;
  int? status;
  String? companyId;
  int? price;
  int? time;
  DateTime? date;
  bool? isPaid;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? cleanBookingIdId;
  int? v;

  CleanBookingId({
    this.taskerIdArr,
    this.paymentMethod,
    this.id,
    this.userId,
    this.cleanId,
    this.status,
    this.companyId,
    this.price,
    this.time,
    this.date,
    this.isPaid,
    this.createdAt,
    this.updatedAt,
    this.cleanBookingIdId,
    this.v,
  });

  CleanBookingId copyWith({
    List<String>? taskerIdArr,
    int? paymentMethod,
    String? id,
    String? userId,
    String? cleanId,
    int? status,
    String? companyId,
    int? price,
    int? time,
    DateTime? date,
    bool? isPaid,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? cleanBookingIdId,
    int? v,
  }) =>
      CleanBookingId(
        taskerIdArr: taskerIdArr ?? this.taskerIdArr,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        id: id ?? this.id,
        userId: userId ?? this.userId,
        cleanId: cleanId ?? this.cleanId,
        status: status ?? this.status,
        companyId: companyId ?? this.companyId,
        price: price ?? this.price,
        time: time ?? this.time,
        date: date ?? this.date,
        isPaid: isPaid ?? this.isPaid,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        cleanBookingIdId: cleanBookingIdId ?? this.cleanBookingIdId,
        v: v ?? this.v,
      );

  factory CleanBookingId.fromJson(Map<String, dynamic> json) => CleanBookingId(
        taskerIdArr: json["taskerIdArr"] == null
            ? []
            : List<String>.from(json["taskerIdArr"]!.map((x) => x)),
        paymentMethod: json["paymentMethod"],
        id: json["_id"],
        userId: json["userId"] ?? json["userId"]["_id"] ?? "",
        cleanId: json["cleanId"],
        status: json["status"],
        companyId: json["companyId"],
        price: json["price"],
        time: json["time"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        isPaid: json["isPaid"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        cleanBookingIdId: json["id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "taskerIdArr": taskerIdArr == null
            ? []
            : List<dynamic>.from(taskerIdArr!.map((x) => x)),
        "paymentMethod": paymentMethod,
        "_id": id,
        "userId": userId,
        "cleanId": cleanId,
        "status": status,
        "companyId": companyId,
        "price": price,
        "time": time,
        "date": date?.toIso8601String(),
        "isPaid": isPaid,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": cleanBookingIdId,
        "__v": v,
      };
}

class CleanBookingReview {
  String? review;

  CleanBookingReview({
    this.review,
  });

  CleanBookingReview copyWith({
    String? review,
  }) =>
      CleanBookingReview(
        review: review ?? this.review,
      );

  factory CleanBookingReview.fromJson(Map<String, dynamic> json) =>
      CleanBookingReview(
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "review": review,
      };
}

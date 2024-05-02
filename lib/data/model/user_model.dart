import 'dart:convert';

class UserModel {
  int? isExpired;
  int? isPendingUpdateCoin;
  String? id;
  DateTime? timeLogin;
  DateTime? lastestTimeRequest;
  User? user;
  String? token;
  String? accessToken;
  String? fcmToken;
  int? device;
  String? deviceId;
  int? v;

  UserModel({
    this.isExpired,
    this.isPendingUpdateCoin,
    this.id,
    this.timeLogin,
    this.lastestTimeRequest,
    this.user,
    this.token,
    this.accessToken,
    this.fcmToken,
    this.device,
    this.deviceId,
    this.v,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        isExpired: json["isExpired"],
        isPendingUpdateCoin: json["isPendingUpdateCoin"],
        id: json["_id"],
        timeLogin: json["timeLogin"] == null
            ? null
            : DateTime.parse(json["timeLogin"]),
        lastestTimeRequest: json["lastestTimeRequest"] == null
            ? null
            : DateTime.parse(json["lastestTimeRequest"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
        accessToken: json["accessToken"],
        fcmToken: json["fcmToken"],
        device: json["device"],
        deviceId: json["deviceId"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "isExpired": isExpired,
        "isPendingUpdateCoin": isPendingUpdateCoin,
        "_id": id,
        "timeLogin": timeLogin?.toIso8601String(),
        "lastestTimeRequest": lastestTimeRequest?.toIso8601String(),
        "user": user?.toJson(),
        "token": token,
        "accessToken": accessToken,
        "fcmToken": fcmToken,
        "device": device,
        "deviceId": deviceId,
        "__v": v,
      };
}

// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class User {
  int? gender;
  String? avatar;
  List<dynamic>? profilePicture;
  String? about;
  int? role;
  dynamic expiredAt;
  int? balance;
  List<dynamic>? freetime;
  String? id;
  String? fullName;
  String? phoneNumber;
  DateTime? registerDate;

  User({
    this.gender,
    this.avatar,
    this.profilePicture,
    this.about,
    this.role,
    this.expiredAt,
    this.balance,
    this.freetime,
    this.id,
    this.fullName,
    this.phoneNumber,
    this.registerDate,
  });

  User copyWith({
    int? gender,
    String? avatar,
    List<dynamic>? profilePicture,
    String? about,
    int? role,
    dynamic expiredAt,
    int? balance,
    List<dynamic>? freetime,
    String? id,
    String? fullName,
    String? phoneNumber,
    DateTime? registerDate,
  }) =>
      User(
        gender: gender ?? this.gender,
        avatar: avatar ?? this.avatar,
        profilePicture: profilePicture ?? this.profilePicture,
        about: about ?? this.about,
        role: role ?? this.role,
        expiredAt: expiredAt ?? this.expiredAt,
        balance: balance ?? this.balance,
        freetime: freetime ?? this.freetime,
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        registerDate: registerDate ?? this.registerDate,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        gender: json["gender"],
        avatar: json["avatar"],
        profilePicture: json["profilePicture"] == null
            ? []
            : List<dynamic>.from(json["profilePicture"]!.map((x) => x)),
        about: json["about"],
        role: json["role"],
        expiredAt: json["expiredAt"],
        balance: json["balance"],
        freetime: json["freetime"] == null
            ? []
            : List<dynamic>.from(json["freetime"]!.map((x) => x)),
        id: json["_id"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        registerDate: json["registerDate"] == null
            ? null
            : DateTime.parse(json["registerDate"]),
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "avatar": avatar,
        "profilePicture": profilePicture == null
            ? []
            : List<dynamic>.from(profilePicture!.map((x) => x)),
        "about": about,
        "role": role,
        "expiredAt": expiredAt,
        "balance": balance,
        "freetime":
            freetime == null ? [] : List<dynamic>.from(freetime!.map((x) => x)),
        "_id": id,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "registerDate": registerDate?.toIso8601String(),
      };
}

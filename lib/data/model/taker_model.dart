class TaskerId {
  String? id;
  String? fullName;
  String? avatar;
  String? phoneNumber;

  TaskerId({
    this.id,
    this.fullName,
    this.avatar,
    this.phoneNumber,
  });

  factory TaskerId.fromJson(Map<String, dynamic> json) => TaskerId(
        id: json["_id"],
        fullName: json["fullName"],
        avatar: json["avatar"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "avatar": avatar,
        "phoneNumber": phoneNumber,
      };
}

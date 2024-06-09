// To parse this JSON data, do
//
//     final taskBookingRating = taskBookingRatingFromJson(jsonString);

import 'dart:convert';

TaskBookingRating taskBookingRatingFromJson(String str) =>
    TaskBookingRating.fromJson(json.decode(str));

String taskBookingRatingToJson(TaskBookingRating data) =>
    json.encode(data.toJson());

class TaskBookingRating {
  int? taskBookingRating;
  TaskBookingReview? taskBookingReview;

  TaskBookingRating({
    this.taskBookingRating,
    this.taskBookingReview,
  });

  TaskBookingRating copyWith({
    int? taskBookingRating,
    TaskBookingReview? taskBookingReview,
  }) =>
      TaskBookingRating(
        taskBookingRating: taskBookingRating ?? this.taskBookingRating,
        taskBookingReview: taskBookingReview ?? this.taskBookingReview,
      );

  factory TaskBookingRating.fromJson(Map<String, dynamic> json) =>
      TaskBookingRating(
        taskBookingRating: json["taskBookingRating"],
        taskBookingReview: json["taskBookingReview"] == null
            ? null
            : TaskBookingReview.fromJson(json["taskBookingReview"]),
      );

  Map<String, dynamic> toJson() => {
        "taskBookingRating": taskBookingRating,
        "taskBookingReview": taskBookingReview?.toJson(),
      };
}

class TaskBookingReview {
  String? review;

  TaskBookingReview({
    this.review,
  });

  TaskBookingReview copyWith({
    String? review,
  }) =>
      TaskBookingReview(
        review: review ?? this.review,
      );

  factory TaskBookingReview.fromJson(Map<String, dynamic> json) =>
      TaskBookingReview(
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "review": review,
      };
}

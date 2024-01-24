// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  int? userId;
  int? id;
  String? title;
  String? body;

  Users({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        userId: json["userId"]?? 0,
        id: json["id"]??0,
        title: json["title"]??"",
        body: json["body"]??"",
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}

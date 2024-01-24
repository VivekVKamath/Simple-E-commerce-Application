import 'dart:convert';

List<Photos> photosFromJson(String str) =>
    List<Photos>.from(json.decode(str).map((x) => Photos.fromJson(x)));

String photosToJson(List<Photos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Photos{
  int? id;
  int? albumId;
  String? title;
  String? url;
  String? thumbnailUrl;

  Photos({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory Photos.fromJson(Map<String, dynamic> json) => Photos(
        albumId: json["albumId"] ?? 0,
        id: json["id"] ?? 0,
        title: json["title"] ?? " ",
        url: json["url"] ?? " ",
        thumbnailUrl: json["thumbnailUrl"] ?? " ",
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}

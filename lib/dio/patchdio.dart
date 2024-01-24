

import 'dart:convert';

import 'package:http/http.dart' as http;

class PatchDio {



  Future getPhotos() async {


    var client = http.Client();

    var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await client.get(uri);
    return response;
  }

  Future patchUsers({required dynamic title,required dynamic id}) async {
    Map<String, dynamic> body = {"title":"$title"};
    final response = await http.patch(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"),
        headers: <String, String>{"Content-type": "application/json"},
        body: jsonEncode(body));
    return response;
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

class AddingDataDio {
  Future postData({required dynamic name}) async{
    final response = await http.post(
      Uri.parse("https://jsonplaceholder.typicode.com/albums"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
    },
      body: jsonEncode({'title': name}),
    );
    return response;
  }
}


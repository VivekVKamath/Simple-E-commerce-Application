import 'package:http/http.dart' as http;

class PhotosDio {
  Future getPhotos() async {
    var client = http.Client();

    var uri = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    var response = await client.get(uri);
    return response;
  }

  Future singlePhoto({required int id}) async {
    var client2 = http.Client();
    var uri2 = Uri.parse("https://jsonplaceholder.typicode.com/photos/$id");
    var response2 = await client2.get(uri2);
    return response2;
  }
}

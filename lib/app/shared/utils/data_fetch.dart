import 'dart:convert';
import 'package:http/http.dart' as http;

Future fetchData(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON.
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 200 OK response, throw an exception.
    throw Exception('Failed to load data');
  }
}

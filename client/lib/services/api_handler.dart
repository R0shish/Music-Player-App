import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> apiHandler(
  String url,
  String method, {
  Map<String, String>? headers = const {"Content-Type": "application/json"},
  Map<String, String>? body,
}) async {
  method = method.toUpperCase();
  http.Response response;

  if (method == 'GET') {
    response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
  } else if (method == 'POST') {
    response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );
  } else if (method == 'PUT') {
    response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );
  } else if (method == 'DELETE') {
    response = await http.delete(
      Uri.parse(url),
      headers: headers,
    );
  } else {
    throw Exception('Invalid method');
  }

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['message'];
  } else {
    return 'Error 500: Internal Server Error';
  }
}

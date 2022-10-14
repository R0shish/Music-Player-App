import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> apiHandler(
  String url,
  String method, {
  Map<String, String>? headers,
  Map<String, String>? body,
  bool authorization = false,
  String? token,
}) async {
  method = method.toUpperCase();
  http.Response response;

  if (authorization) {
    if (token == null) throw Exception('Token is null');
    headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  } else {
    headers = {'Content-Type': 'application/json'};
  }

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
    return jsonDecode(response.body);
  } else {
    throw Exception('Error 500: Internal Server Error');
  }
}

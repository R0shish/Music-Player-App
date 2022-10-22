import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:music_player/constants/api_constant.dart';

Future<dynamic> apiHandler(
  String url,
  String method, {
  Map<String, String>? headers,
  Map<String, String>? body,
  bool authorization = false,
  Box? userDataBox,
}) async {
  method = method.toUpperCase();
  http.Response response;
  String token = userDataBox?.get('access_token') ?? '';

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

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
      body: jsonEncode(body),
    );
  } else {
    throw Exception('Invalid method');
  }

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else if (response.statusCode == 403) {
    await regenerateAccessToken(headers, userDataBox!);
    return apiHandler(
      url,
      method,
      headers: headers,
      body: body,
      authorization: authorization,
      userDataBox: userDataBox,
    );
  } else {
    throw Exception('Error 500: Internal Server Error');
  }
}

regenerateAccessToken(Map<String, String> headers, Box userDataBox) async {
  Map<String, String> body = {
    'refresh_token': userDataBox.get('refresh_token'),
  };
  var response = await apiHandler(Api.regenerateToken, 'POST',
      headers: headers, body: body);
  userDataBox.put('access_token', response['access_token']);
}

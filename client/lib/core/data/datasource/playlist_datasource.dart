import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

abstract class PlaylistDataSource {
  Future<List<dynamic>> getPlaylist();
}

class PlaylistDataSourceImpl implements PlaylistDataSource {
  PlaylistDataSourceImpl();

  @override
  Future<List<dynamic>> getPlaylist() async {
    final response = await http.get(
        Platform.isAndroid
            ? Uri.parse('http://10.0.2.2:3500/api/playlist/getPlaylist')
            : Uri.parse('http://localhost:3500/api/playlist/getPlaylist'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return Future.value(json.decode(response.body));
    } else {
      throw Exception('Failed to load playlist');
    }
  }
}

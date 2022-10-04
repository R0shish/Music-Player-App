import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:music_player/constants/api_constant.dart';

abstract class PlaylistDataSource {
  Future<List<dynamic>> getPlaylist();
}

class PlaylistDataSourceImpl implements PlaylistDataSource {
  PlaylistDataSourceImpl();

  @override
  Future<List<dynamic>> getPlaylist() async {
    final response = await http.get(Uri.parse(Api.getPlaylist),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return Future.value(json.decode(response.body));
    } else {
      throw Exception('Failed to load playlist');
    }
  }
}

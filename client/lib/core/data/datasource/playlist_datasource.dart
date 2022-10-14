import 'package:music_player/services/api_handler.dart';
import '../../../constants/constants.dart';

abstract class PlaylistDataSource {
  Future<List<dynamic>> getPlaylist();
}

class SuggestedPlaylistDataSourceImpl implements PlaylistDataSource {
  SuggestedPlaylistDataSourceImpl();

  @override
  Future<List<dynamic>> getPlaylist() async {
    final response = await apiHandler(Api.getSuggestedPlaylist, 'GET');
    return Future.value(response);
  }
}

// import 'dart:io';

class Api {
  // API on localhost
  // static String baseURL =
  //     Platform.isAndroid ? "http://10.0.2.2:3500" : "http://localhost:3500";

  // API Hosted on Heroku
  static String baseURL = "https://flutter-music-player-app.herokuapp.com";

  // Auth
  static String login = "$baseURL/api/auth/login";
  static String register = "$baseURL/api/auth/register";
  static String regenerateToken = "$baseURL/api/auth/regenerateToken";

  // Playlist
  static String playlist = "$baseURL/api/playlist";
  static String getPlaylist = "$playlist/getPlaylist";

  // Suggested
  static String suggestion = "$baseURL/api/suggestion";
  static String getSuggestedPlaylist = "$suggestion/getSuggestedPlaylist";
}

// import 'dart:io';

class Api {
  // API on localhost
  // static String baseURL =
  //     Platform.isAndroid ? "http://10.0.2.2:3500" : "http://localhost:3500";

  // API Hosted on Heroku
  static String baseURL = "https://flutter-music-player-app.herokuapp.com";

  // Auth
  static String auth = "$baseURL/api/auth";
  static String login = "$auth/login";
  static String register = "$auth/register";
  static String regenerateToken = "$auth/regenerateToken";

  // User
  static String user = "$baseURL/api/user";
  static String userData = "$user/getUserData";

  // Suggested
  static String suggestion = "$baseURL/api/suggestion";
  static String getSuggestedPlaylist = "$suggestion/getSuggestedPlaylist";
}

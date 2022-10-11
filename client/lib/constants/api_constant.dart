import 'dart:io';

class Api {
  static String baseURL =
      Platform.isAndroid ? "http://10.0.2.2:3500" : "http://localhost:3500";
  static String login = "$baseURL/api/auth/login";
  static String register = "$baseURL/api/auth/register";
  static String playlist = "$baseURL/api/playlist";
  static String getPlaylist = "$playlist/getPlaylist";
}

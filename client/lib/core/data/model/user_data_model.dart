import 'package:music_player/core/data/model/playlist_model.dart';

class User {
  final String name;
  final String email;
  String? avatar;
  final List<Playlist> playlists;
  User({
    required this.name,
    required this.email,
    this.avatar,
    required this.playlists,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      playlists: List<Playlist>.from(
          json['playlists'].map((x) => Playlist.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'avatar': avatar,
        'playlists': List<dynamic>.from(playlists.map((x) => x.toJson())),
      };
}

import 'song_model.dart';

class Playlist {
  String title;
  String image;
  List<Song> songs = [];
  Playlist({required this.title, required this.image, required this.songs});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['songs'] = songs.map((song) => song.toJson()).toList();
    return data;
  }

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
        title: json['title'],
        image: json['image'],
        songs: json['songs'].map<Song>((song) => Song.fromJson(song)).toList());
  }
}

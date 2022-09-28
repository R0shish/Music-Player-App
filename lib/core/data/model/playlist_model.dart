import 'song_model.dart';

class Playlist {
  String title;
  String subTitle;
  String image;
  List<Song> songs = [];
  Playlist(
      {required this.title,
      required this.subTitle,
      required this.image,
      required this.songs});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['image'] = image;
    data['songs'] = songs.map((song) => song.toJson()).toList();
    return data;
  }

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
        title: json['title'],
        subTitle: json['subTitle'],
        image: json['image'],
        songs: json['songs'].map<Song>((song) => Song.fromJson(song)).toList());
  }
}

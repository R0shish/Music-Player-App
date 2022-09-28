class Song {
  final String name;
  final String artist;
  final String albumArt;
  final String duration;
  final String url;
  Song(
      {required this.name,
      required this.artist,
      required this.albumArt,
      required this.duration,
      required this.url});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['artist'] = artist;
    data['albumArt'] = albumArt;
    data['duration'] = duration;
    data['url'] = url;
    return data;
  }

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
        name: json['name'],
        artist: json['artist'],
        albumArt: json['albumArt'],
        duration: json['duration'],
        url: json['url']);
  }
}

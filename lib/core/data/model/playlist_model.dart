class Playlist {
  String title;
  String subTitle;
  String image;
  Playlist({required this.title, required this.subTitle, required this.image});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['image'] = image;
    return data;
  }

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      title: json['title'],
      subTitle: json['subTitle'],
      image: json['image'],
    );
  }
}

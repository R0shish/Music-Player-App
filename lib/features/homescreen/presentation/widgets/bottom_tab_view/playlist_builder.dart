import 'package:flutter/material.dart';

import '../../../../../constants/dimensions.dart';
import '../../../../../core/widgets/playlist_container.dart';
import '../../../../../model/playlist_model.dart';

class PlaylistBuilder extends StatelessWidget {
  final Map<String, dynamic> playlistData;
  const PlaylistBuilder({
    Key? key,
    required this.playlistData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight * 0.23,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: playlistData['data'].length,
        itemBuilder: ((context, index) {
          Playlist playlist = Playlist.fromJson(
            playlistData['data'][index],
          );
          return PlaylistContainer(
            title: playlist.title,
            subTitle: playlist.subTitle,
            image: playlist.image,
          );
        }),
      ),
    );
  }
}

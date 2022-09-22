import 'package:flutter/material.dart';
import 'package:music_player/core/data/playlist_data.dart';
import 'package:music_player/core/data/podcast_data.dart';

import '../../../../../constants/dimensions.dart';
import '../../../../../core/widgets/title_style_text.dart';
import 'playlist_builder.dart';
import 'podcast_builder.dart';

class ForYouTab extends StatelessWidget {
  const ForYouTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleStyleText(
          text1: 'Suggestion Playlist',
          text2: 'for you',
        ),
        SizedBox(
          height: deviceHeight * 0.03,
        ),
        PlaylistBuilder(
          playlistData: playlistData,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.025),
          child: const TitleStyleText(
            text1: 'Special Podcast',
            text2: 'for you',
          ),
        ),
        PodcastBuilder(
          podcastData: podcastData,
        ),
      ],
    );
  }
}

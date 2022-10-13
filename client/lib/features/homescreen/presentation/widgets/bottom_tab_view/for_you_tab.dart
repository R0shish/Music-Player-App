import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/presentation/cubit/playlist_cubit/playlist_cubit.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/data/datasource/podcast_data.dart';
import '../../../../../core/presentation/widgets/widgets.dart';
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
        BlocBuilder<PlaylistCubit, PlaylistState>(
          builder: (context, state) {
            if (state is PlaylistLoading) {
              return Center(
                  child: Lottie.asset('assets/lottie/loading.json',
                      height: deviceHeight * 0.2, fit: BoxFit.cover));
            } else if (state is PlaylistLoaded) {
              return PlaylistBuilder(playlistData: state.playlist);
            } else if (state is PlaylistError) {
              return Center(
                child: Text(state.error),
              );
            }
            return const Center(
              child: Text('Something went wrong'),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.025),
          child: const TitleStyleText(
            text1: 'Special Podcast',
            text2: 'for you',
          ),
        ),
        PodcastBuilder(podcastData: podcastData),
      ],
    );
  }
}

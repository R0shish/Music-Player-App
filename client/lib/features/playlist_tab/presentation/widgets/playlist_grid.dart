import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/constants/dimensions.dart';
import 'package:music_player/core/presentation/cubit/cubit.dart';
import 'package:music_player/features/homescreen/presentation/widgets/bottom_tab_view/playlist_builder.dart';

class PlaylistGrid extends StatelessWidget {
  const PlaylistGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your Playlist', style: Theme.of(context).textTheme.headline1),
        BlocBuilder<UserDataCubit, UserDataState>(
          builder: (context, state) {
            if (state.isLoggedIn) {
              return PlaylistBuilder(
                playlistData: state.user.playlists,
                isGrid: true,
              );
            } else {
              return SizedBox(
                  height: deviceHeight * 0.2,
                  child: const Center(
                      child: Text('Please login to see your playlists')));
            }
          },
        ),
      ],
    );
  }
}

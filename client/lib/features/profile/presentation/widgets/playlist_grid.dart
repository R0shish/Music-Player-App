import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/constants/dimensions.dart';
import 'package:music_player/core/presentation/cubit/cubit.dart';
import 'package:music_player/core/presentation/widgets/widgets.dart';
import 'package:music_player/features/homescreen/presentation/widgets/bottom_tab_view/playlist_builder.dart';

import '../../../../constants/constants.dart';

class PlaylistGrid extends StatelessWidget {
  const PlaylistGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextTitle(
          text: 'Your Playlist',
          fontSize: 18,
        ),
        BlocBuilder<UserDataCubit, UserDataState>(
          builder: (context, state) {
            if (state.isLoggedIn) {
              if (state.user.playlists.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: deviceHeight * 0.02),
                        child: Image.asset(
                          'assets/images/void.png',
                          height: deviceHeight * 0.23,
                        ),
                      ),
                      const Text(
                        'No Playlist Found',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: deviceHeight * 0.02),
                      CustomRoundedButton(
                        text: 'Create Playlist',
                        onPressed: () {},
                      ),
                      SizedBox(height: deviceHeight * 0.08),
                    ],
                  ),
                );
              }
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

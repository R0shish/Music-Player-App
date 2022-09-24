import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/constants/dimensions.dart';
import 'package:music_player/core/widgets/progress_bar.dart';
import '../cubit/now_playing_cubit.dart';
import '../widgets/album_art_container.dart';
import '../widgets/control_row.dart';
import '../widgets/now_playing_title_row.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 0.2,
        maxChildSize: 1,
        builder: ((context, scrollController) => Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  height: deviceHeight,
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const NowPlayingTitleRow(),
                      const AlbumArtContainer(),
                      BlocBuilder<NowPlayingCubit, NowPlayingState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              Text(state.song!.name,
                                  style: Theme.of(context).textTheme.headline1),
                              Text(state.song!.artist,
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          );
                        },
                      ),
                      const ProgressBar(),
                      const ControlRow(),
                      SizedBox(
                        height: deviceHeight * 0.05,
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}

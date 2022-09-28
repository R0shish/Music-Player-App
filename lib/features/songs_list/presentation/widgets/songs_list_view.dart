import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/color_constant.dart';
import '../../../../constants/text_theme.dart';
import '../../../../core/data/model/song_model.dart';
import '../../../../core/presentation/cubit/play_pause_cubit/cubit/play_pause_cubit.dart';
import '../../../now_playing/presentation/cubit/now_playing_cubit.dart';

class SongsListView extends StatefulWidget {
  const SongsListView({
    Key? key,
    required this.songsList,
    required this.playlistIndex,
  }) : super(key: key);

  final List<Song> songsList;
  final int playlistIndex;

  @override
  State<SongsListView> createState() => _SongsListViewState();
}

class _SongsListViewState extends State<SongsListView>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _expandedKey = GlobalKey<ScaffoldState>();

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat(reverse: false);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void didChangeDependencies() {
    _controller.repeat(reverse: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: _expandedKey,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.songsList.length,
        itemBuilder: ((_, index) {
          return BlocBuilder<NowPlayingCubit, NowPlayingState>(
            builder: (__, state) {
              NowPlayingCubit cubit = context.read<NowPlayingCubit>();
              PlayPauseCubit playPauseCubit = context.read<PlayPauseCubit>();

              bool isPlaying = cubit.isCurrentSongPlaying(
                  songIndex: index, playlistIndex: widget.playlistIndex);

              CircleAvatar songArt = CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                    widget.songsList[index].albumArt),
              );

              return ListTile(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                shape: isPlaying
                    ? RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.teal, width: 0.3),
                        borderRadius: BorderRadius.circular(20),
                      )
                    : null,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                leading: isPlaying
                    ? BlocBuilder<PlayPauseCubit, PlayPauseState>(
                        builder: (context, state) {
                          if (state is PlayingState) {
                            _controller.repeat(reverse: false);
                          } else {
                            _controller.stop();
                          }
                          return RotationTransition(
                              turns: _animation, child: songArt);
                        },
                      )
                    : songArt,
                title: nowPlayingText(
                    text: widget.songsList[index].name,
                    color: isPlaying ? Colors.teal : AppColor.secondary),
                subtitle: nowPlayingText(
                    text: widget.songsList[index].artist,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: isPlaying ? Colors.teal : AppColor.secondary),
                trailing: isPlaying
                    ? BlocBuilder<PlayPauseCubit, PlayPauseState>(
                        builder: (context, state) {
                          return nowPlayingText(
                              text: state is PlayingState
                                  ? 'Now Playing'
                                  : 'Paused',
                              fontSize: 14,
                              color: Colors.teal);
                        },
                      )
                    : null,
                onTap: () {
                  cubit.updateSong(
                      song: Song(
                          name: widget.songsList[index].name,
                          artist: widget.songsList[index].artist,
                          albumArt: widget.songsList[index].albumArt,
                          duration: widget.songsList[index].duration,
                          url: widget.songsList[index].url),
                      songIndex: index,
                      playlistIndex: widget.playlistIndex);

                  playPauseCubit.play(widget.songsList[index].url);
                },
              );
            },
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../core/data/model/song_model.dart';
import '../widgets/songs_list_title_row.dart';
import '../widgets/songs_list_view.dart';

class SongsList extends StatelessWidget {
  final String playlistTitle;
  final int playlistIndex;
  final List<Song> songsList;
  const SongsList(
      {Key? key,
      required this.playlistTitle,
      required this.playlistIndex,
      required this.songsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 0.2,
        maxChildSize: 1,
        builder: ((context, scrollController) => Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(2),
                  height: deviceHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SongsListTitleRow(playlistTitle: playlistTitle),
                      SongsListView(
                          songsList: songsList, playlistIndex: playlistIndex),
                    ],
                  ),
                ),
              ),
            )));
  }
}

import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../widgets/last_played_row.dart';
import '../widgets/playlist_grid.dart';
import '../widgets/search_row.dart';
import '../widgets/top_listview_container.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: deviceHeight * 0.06),
                Text('Playlist', style: Theme.of(context).textTheme.headline1),
                SizedBox(height: deviceHeight * 0.02),
                const SearchRow(),
                SizedBox(height: deviceHeight * 0.02),
                const TopListViewContainer(),
                SizedBox(height: deviceHeight * 0.03),
                const LastPlayedRow(),
                SizedBox(height: deviceHeight * 0.03),
                const PlaylistGrid(),
              ],
            ),
          ),
        ));
  }
}

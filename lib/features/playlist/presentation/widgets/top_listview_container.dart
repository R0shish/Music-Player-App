import 'package:flutter/material.dart';

import '../../../../constants/dimensions.dart';
import '../../../../core/presentation/widgets/playlist_container.dart';

class TopListViewContainer extends StatelessWidget {
  const TopListViewContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight * 0.23,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return PlaylistContainer(
                title: 'Special Music',
                subTitle: 'For You',
                albumArt: null,
                backgroundImage:
                    'https://cdn.ytechb.com/wp-content/uploads/2021/02/best-wallpapers-for-iphone-12-3.webp',
                onPlayTap: () {});
          }),
    );
  }
}

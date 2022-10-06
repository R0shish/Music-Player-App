import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../core/presentation/widgets/widgets.dart';

class PlaylistGrid extends StatelessWidget {
  const PlaylistGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Playlist', style: Theme.of(context).textTheme.headline1),
        SizedBox(height: deviceHeight * 0.02),
        for (var i = 0; i < 4; i++) ...[
          Row(
            children: [
              Expanded(
                child: PlaylistContainer(
                    marginRight: 0,
                    heightFactor: 0.23,
                    title: 'For Sleep',
                    subTitle: '100 Songs',
                    backgroundImage: null,
                    albumArt:
                        'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/602f4731226337.5646928c3633f.jpg',
                    onPlayTap: () {}),
              ),
              SizedBox(width: deviceWidth * 0.03),
              Expanded(
                child: PlaylistContainer(
                    marginRight: 0,
                    heightFactor: 0.23,
                    title: 'For Sleep',
                    subTitle: '100 Songs',
                    backgroundImage: null,
                    albumArt:
                        'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/602f4731226337.5646928c3633f.jpg',
                    onPlayTap: () {}),
              )
            ],
          ),
          SizedBox(height: deviceHeight * 0.01),
        ],
        SizedBox(height: deviceHeight * 0.12),
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_player/constants/constants.dart';
import 'package:music_player/core/presentation/widgets/widgets.dart';

import '../../../../core/presentation/cubit/cubit.dart';

class TopWidget extends StatelessWidget {
  final UserDataLoaded state;
  const TopWidget({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              bottom: deviceHeight * 0.04, top: deviceHeight * 0.02),
          child: const Center(child: TextTitle(text: 'Profile')),
        ),
        Center(
            child: CircleAvatar(
          radius: deviceHeight * 0.07,
          backgroundImage: CachedNetworkImageProvider(state.user.avatar ??
              'https://sites.cns.utexas.edu/sites/default/files/geometry_lab/files/default_person.jpg?m=1654796730'),
        )),
        Padding(
          padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.02),
          child: Center(child: TextTitle(text: state.userData.name)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.02),
          child: Center(child: TextTitle(text: state.userData.email)),
        ),
      ],
    );
  }
}

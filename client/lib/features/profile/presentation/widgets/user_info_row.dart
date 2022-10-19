import 'package:flutter/material.dart';

import '../../../../core/presentation/cubit/cubit.dart';
import '../../../../core/presentation/widgets/widgets.dart';

class UserInfoRow extends StatelessWidget {
  final UserDataLoaded state;
  const UserInfoRow({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TitleStyleText(
            text1: '${state.userData.playlists.length}',
            text2: '\n\nPlaylists',
            textAlign: TextAlign.center,
            fontSize: 16,
          ),
        ),
        const Expanded(
          child: TitleStyleText(
            text1: '0',
            text2: '\n\nFollowers',
            textAlign: TextAlign.center,
            fontSize: 16,
          ),
        ),
        const Expanded(
          child: TitleStyleText(
            text1: '0',
            text2: '\n\nFollowing',
            textAlign: TextAlign.center,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

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
            text2: '\nPlaylists',
            textAlign: TextAlign.center,
            fontSize: 20,
          ),
        ),
        const Expanded(
          child: TitleStyleText(
            text1: '0\n',
            text2: 'Followers',
            textAlign: TextAlign.center,
            fontSize: 20,
          ),
        ),
        const Expanded(
          child: TitleStyleText(
            text1: '0\n',
            text2: 'Following',
            textAlign: TextAlign.center,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

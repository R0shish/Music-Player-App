import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          padding: EdgeInsets.only(bottom: deviceHeight * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              const TextTitle(
                text: 'Profile',
                fontSize: 18,
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: IconButton(
                  alignment: Alignment.centerRight,
                  enableFeedback: false,
                  icon: const Icon(
                    Icons.logout_rounded,
                    color: AppColor.secondary,
                  ),
                  onPressed: () =>
                      context.read<AuthenticationCubit>().logout(context),
                ),
              ),
            ],
          ),
        ),
        Center(
            child: CircleAvatar(
          radius: deviceHeight * 0.06,
          backgroundImage: CachedNetworkImageProvider(state.user.avatar ??
              'https://sites.cns.utexas.edu/sites/default/files/geometry_lab/files/default_person.jpg?m=1654796730'),
        )),
        Padding(
          padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.015),
          child: Center(
              child: TextTitle(
            text: state.userData.name,
            fontSize: 22,
          )),
        ),
        CustomRoundedButton(
            text: 'Edit Profile',
            onPressed: () => debugPrint('TO:DO: Edit Profile'))
      ],
    );
  }
}

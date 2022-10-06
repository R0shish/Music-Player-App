import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/cubit/cubit.dart';

import '../../../../constants/constants.dart';
import '../../../../core/presentation/widgets/widgets.dart';

class ControlRow extends StatelessWidget {
  const ControlRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlayPauseCubit playPauseCubit = context.read<PlayPauseCubit>();
    final RepeatCubit repeatCubit = context.read<RepeatCubit>();

    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
      builder: (_, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _iconButtonBuilder(context,
                onPressed: () {}, iconData: Icons.shuffle),
            _iconButtonBuilder(context, onPressed: () {
              repeatCubit.resetRepeat();
              playPauseCubit.playPrev();
            }, iconData: Icons.skip_previous),
            PlayPauseButton(
              color: AppColor.primary,
              url: state.song!.url,
            ),
            _iconButtonBuilder(context, onPressed: () {
              repeatCubit.resetRepeat();
              playPauseCubit.playNext();
            }, iconData: Icons.skip_next),
            _iconButtonBuilder(context,
                iconData: context.watch<RepeatCubit>().repeatIcon,
                iconColor: context.watch<RepeatCubit>().repeatIconColor,
                onPressed: () {
              context.read<RepeatCubit>().toggleRepeat();
            }),
          ],
        );
      },
    );
  }
}

IconButton _iconButtonBuilder(
  BuildContext context, {
  required VoidCallback onPressed,
  required IconData iconData,
  double iconSize = 25,
  Color iconColor = AppColor.lightGrey,
}) {
  return IconButton(
      iconSize: iconSize,
      onPressed: onPressed,
      icon: Icon(iconData, color: iconColor));
}

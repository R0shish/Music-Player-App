import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/widgets/play_pause.dart';
import '../../../../now_playing/presentation/cubit/now_playing_cubit.dart';

import '../../../../../constants/color_constant.dart';
import '../../../../../constants/dimensions.dart';

class SongInformationRow extends StatelessWidget {
  const SongInformationRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NowPlayingCubit cubit = context.read<NowPlayingCubit>();
    return Row(
      children: [
        BlocBuilder<NowPlayingCubit, NowPlayingState>(
          builder: (context, state) {
            return Container(
              width: deviceWidth * 0.17,
              height: deviceHeight * 0.08,
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: cubit.songImage, fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
        ),
        SizedBox(width: deviceWidth * 0.03),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<NowPlayingCubit, NowPlayingState>(
                builder: (context, state) {
                  return Text(
                    state.song!.name,
                    style: Theme.of(context).textTheme.headline2,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  );
                },
              ),
              SizedBox(height: deviceHeight * 0.01),
              BlocBuilder<NowPlayingCubit, NowPlayingState>(
                builder: (context, state) {
                  return Text(
                    state.song!.artist,
                    style: Theme.of(context).textTheme.bodyText1,
                  );
                },
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => debugPrint('add to favorite'),
          child: const Icon(
            Icons.favorite_border,
            color: AppColor.secondary,
          ),
        ),
        BlocBuilder<NowPlayingCubit, NowPlayingState>(
          builder: (context, state) {
            return PlayPauseButton(
              url: state.song!.url,
            );
          },
        )
      ],
    );
  }
}

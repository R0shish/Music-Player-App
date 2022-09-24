import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/now_playing_cubit.dart';

import '../../../../constants/dimensions.dart';

class AlbumArtContainer extends StatelessWidget {
  const AlbumArtContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NowPlayingCubit cubit = context.read<NowPlayingCubit>();
    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
      builder: (context, state) {
        return Container(
          width: deviceWidth,
          height: deviceHeight * 0.4,
          decoration: BoxDecoration(
              image: DecorationImage(image: cubit.songImage, fit: BoxFit.cover),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
        );
      },
    );
  }
}

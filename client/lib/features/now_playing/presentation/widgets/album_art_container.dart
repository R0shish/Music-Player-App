import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/now_playing_cubit/now_playing_cubit.dart';

class AlbumArtContainer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  const AlbumArtContainer(
      {Key? key,
      required this.width,
      required this.height,
      this.borderRadius = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
      builder: (context, state) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: context.read<NowPlayingCubit>().songImage,
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        );
      },
    );
  }
}

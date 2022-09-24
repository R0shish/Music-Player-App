import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../now_playing/presentation/cubit/now_playing_cubit.dart';
import '../../../../../constants/color_constant.dart';
import '../../../../../constants/dimensions.dart';
import '../../../../../core/widgets/progress_bar.dart';
import '../../../../now_playing/presentation/pages/now_playing.dart';
import 'song_info_row.dart';

class NowPlayingContainer extends StatelessWidget {
  const NowPlayingContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) => BlocProvider<NowPlayingCubit>.value(
          value: context.read<NowPlayingCubit>(),
          child: const NowPlaying(),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(
            top: deviceHeight * 0.02,
            left: deviceWidth * 0.03,
            right: deviceWidth * 0.03),
        height: deviceHeight / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SongInformationRow(),
              SizedBox(height: deviceHeight * 0.02),
              const ProgressBar(),
            ],
          ),
        ),
      ),
    );
  }
}

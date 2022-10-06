import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/constants.dart';
import '../../../now_playing/presentation/cubit/now_playing_cubit/now_playing_cubit.dart';
import '../widgets/bottom_tab_view/bottom_tab_view.dart';
import '../widgets/now_playing_container/now_playing_container.dart';
import '../widgets/top_widget.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              const TopWidget(),
              BlocBuilder<NowPlayingCubit, NowPlayingState>(
                builder: (context, state) {
                  if (state.song != null) {
                    return const NowPlayingContainer();
                  }
                  return SizedBox(
                    height: deviceHeight * 0.02,
                  );
                },
              ),
              const BottomTabView(),
            ],
          )),
        ));
  }
}

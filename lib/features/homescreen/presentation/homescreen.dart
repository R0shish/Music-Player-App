import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';
import 'widgets/bottom_tab_view/bottom_tab_view.dart';
import 'widgets/now_playing/now_playing_container.dart';
import 'widgets/top_widget.dart';

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
            children: const <Widget>[
              TopWidget(),
              NowPlayingContainer(),
              BottomTabView(),
            ],
          )),
        ));
  }
}

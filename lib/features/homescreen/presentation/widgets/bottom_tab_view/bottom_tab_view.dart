import 'package:flutter/material.dart';

import '../../../../../constants/color_constant.dart';
import '../../../../../constants/dimensions.dart';
import 'for_you_tab.dart';

class BottomTabView extends StatelessWidget {
  const BottomTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TabBar(
            physics: const ClampingScrollPhysics(),
            labelColor: AppColor.black,
            unselectedLabelColor: AppColor.lightGrey,
            indicator: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(10)),
            isScrollable: true,
            tabs: const [
              Tab(text: 'For You'),
              Tab(text: 'Trending'),
              Tab(text: 'Newest'),
              Tab(text: 'Electronic'),
              Tab(text: 'Hip-hop'),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16.0, top: 10),
          height: deviceHeight * 0.82,
          child: TabBarView(children: [
            const ForYouTab(),
            Container(color: Colors.red),
            Container(color: Colors.purple),
            Container(color: Colors.green),
            Container(color: Colors.yellow),
          ]),
        )
      ],
    );
  }
}

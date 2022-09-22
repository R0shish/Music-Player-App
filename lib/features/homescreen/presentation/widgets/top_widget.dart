import 'package:flutter/material.dart';

import '../../../../constants/color_constant.dart';
import '../../../../constants/dimensions.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: deviceHeight * 0.07,
          left: deviceWidth * 0.03,
          right: deviceWidth * 0.03),
      height: deviceHeight / 10,
      width: deviceWidth,
      decoration: BoxDecoration(
        color: AppColor.darkGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            radius: deviceWidth * 0.05,
            foregroundImage: const NetworkImage(
              'https://i.pinimg.com/originals/9d/0a/0e/9d0a0e0f1798ad455cb4be47f8da992d.jpg',
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: deviceWidth * 0.01),
              Text(
                'Good Morning,',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'Roshish Shrestha',
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(height: deviceWidth * 0.01),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: deviceWidth * 0.13,
            height: deviceHeight * 0.06,
            decoration: const BoxDecoration(
                color: AppColor.grey, shape: BoxShape.circle),
            child: Icon(
              Icons.notifications_outlined,
              color: AppColor.secondary,
              size: deviceWidth * 0.056,
            ),
          ),
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';

import '../../constants/color_constant.dart';
import '../../constants/dimensions.dart';

class PodcastContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  const PodcastContainer({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 8,
          child: Container(
            width: deviceWidth * 0.48,
            margin: const EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(color: AppColor.lightGrey, blurRadius: 0.1)
                ],
                border: Border.all(
                  color: AppColor.grey,
                )),
          ),
        ),
        SizedBox(height: deviceHeight * 0.01),
        Expanded(
          child: Container(
            constraints: BoxConstraints(maxWidth: deviceWidth * 0.48),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline1,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Expanded(
          child: Container(
            constraints: BoxConstraints(maxWidth: deviceWidth * 0.48),
            child: Text(
              subTitle,
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}

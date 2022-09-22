import 'package:flutter/material.dart';

import '../../constants/color_constant.dart';
import '../../constants/dimensions.dart';

class PlaylistContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  const PlaylistContainer(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: deviceWidth * 0.48,
      margin: const EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
          color: AppColor.black,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(color: AppColor.lightGrey, blurRadius: 0.1)
          ],
          border: Border.all(
            color: AppColor.grey,
          )),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: deviceWidth * 0.3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      subTitle,
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.more_vert,
                color: AppColor.lightGrey,
              )
            ],
          ),
          const Spacer(),
          Container(
            alignment: Alignment.bottomRight,
            height: deviceHeight * 0.12,
            width: deviceWidth * 0.4,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover),
            ),
            child: Container(
              margin: const EdgeInsets.all(10),
              width: deviceWidth * 0.08,
              height: deviceHeight * 0.04,
              decoration: const BoxDecoration(
                color: AppColor.lightBlack,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow,
                color: AppColor.lightGrey,
              ),
            ),
          )
        ],
      ),
    );
  }
}

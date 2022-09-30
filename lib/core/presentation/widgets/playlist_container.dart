import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constants/color_constant.dart';
import '../../../constants/dimensions.dart';

class PlaylistContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? albumArt;
  final String? backgroundImage;
  final VoidCallback onPlayTap;
  final double heightFactor;
  final double widthFactor;
  final double marginRight;
  const PlaylistContainer({
    Key? key,
    required this.title,
    required this.subTitle,
    this.albumArt,
    this.backgroundImage,
    required this.onPlayTap,
    this.heightFactor = 0.24,
    this.widthFactor = 0.48,
    this.marginRight = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: deviceHeight * heightFactor,
      width: deviceWidth * widthFactor,
      margin: EdgeInsets.only(right: marginRight),
      decoration: BoxDecoration(
          color: AppColor.black,
          image: backgroundImage != null
              ? DecorationImage(
                  image: CachedNetworkImageProvider(backgroundImage!),
                  fit: BoxFit.fill)
              : null,
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
                constraints: BoxConstraints(
                    maxWidth: albumArt != null
                        ? deviceWidth * 0.3
                        : deviceWidth * 0.38),
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
              if (albumArt != null)
                const Icon(
                  Icons.more_vert,
                  color: AppColor.lightGrey,
                )
            ],
          ),
          const Spacer(),
          Container(
            alignment: Alignment.bottomRight,
            height: deviceHeight * 0.11,
            width: deviceWidth * 0.4,
            decoration: albumArt != null
                ? BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(albumArt!),
                        fit: BoxFit.cover),
                  )
                : null,
            child: Container(
              margin: const EdgeInsets.all(2),
              width: deviceWidth * 0.08,
              height: deviceHeight * 0.04,
              decoration: const BoxDecoration(
                color: AppColor.lightBlack,
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: onPlayTap,
                child: const Icon(
                  Icons.play_arrow,
                  color: AppColor.lightGrey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

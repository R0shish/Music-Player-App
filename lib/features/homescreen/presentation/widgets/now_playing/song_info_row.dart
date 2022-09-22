import 'package:flutter/material.dart';

import '../../../../../constants/color_constant.dart';
import '../../../../../constants/dimensions.dart';

class SongInformationRow extends StatelessWidget {
  const SongInformationRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: deviceWidth * 0.17,
          height: deviceHeight * 0.08,
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: NetworkImage(
                    'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/182867004/original/4dce7319c44927b535961b23626e987e2282051b/draw-cool-album-cover-art-with-unique-aesthetic-style.jpg')),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(width: deviceWidth * 0.03),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Song Title 1',
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(height: deviceHeight * 0.01),
              Text(
                'Artist Name 1',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        const Icon(
          Icons.favorite_border,
          color: AppColor.secondary,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10.0),
          width: deviceWidth * 0.15,
          height: deviceHeight * 0.05,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.grey,
          ),
          child: const Icon(
            Icons.play_arrow,
            color: AppColor.secondary,
            size: 32,
          ),
        )
      ],
    );
  }
}
